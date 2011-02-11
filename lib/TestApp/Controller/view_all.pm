package TestApp::Controller::view_all;
use Moose;
use namespace::autoclean;
use Tidy::Spreadsheet;

BEGIN {extends 'Catalyst::Controller::HTML::FormFu'; }

=head1 NAME

TestApp::Controller::view_all - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut


=head1 AUTHOR

Ashley Pope

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut



sub imported_file :Local {
	my ($self, $c) = @_;


	my $upload = $c->request->upload('file');
	my $file = $upload->filename;
        my $target = "root/downloads/" . $file;	

    	unless ($upload->link_to($target) || $upload->copy_to($target)) {
            die ( "Failed to copy '$file' to '$target': $1" );
        }
        
        my $delimiter = $c->request->params->{delimiter};

        my $spreadsheet = Tidy::Spreadsheet->new();

        $spreadsheet->load_spreadsheet($target);

        my @headers_array = $spreadsheet->get_headers();
        my @edited_contents = $spreadsheet->row_split(2,$delimiter);
        my $newfile = $target. ".fixed";
        unlink($target);

        $spreadsheet->save_contents($newfile, \@headers_array, \@edited_contents);
    
        
        my @url = split q{root/}, $newfile; 
	$c->stash(newfile => $url[1]);
        $c->stash(contents => \@edited_contents);
	$c->stash(header => \@headers_array); 
        $c->stash(template => 'view_all/imported_file.tt');	
        
 }


sub index :Path :Args(0) {
	my ($self, $c) = @_;	

	$c->stash(file => $c->request->params->{file});	
	$c->stash(template => 'view_all/import.tt');
}




__PACKAGE__->meta->make_immutable;

1;
