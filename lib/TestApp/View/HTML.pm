package TestApp::View::HTML;

use strict;
use warnings;

use base 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt',
    INCLUDE_PATH => [ TestApp->path_to( 'root', 'src'), ],
    render_die => 1,
);

=head1 NAME

TestApp::View::HTML - TT View for TestApp

=head1 DESCRIPTION

TT View for TestApp.

=head1 SEE ALSO

L<TestApp>

=head1 AUTHOR

Ashley Pope

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
