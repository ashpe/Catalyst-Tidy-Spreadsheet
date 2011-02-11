use strict;
use warnings;
use Test::More;

BEGIN { use_ok 'Catalyst::Test', 'TestApp' }
BEGIN { use_ok 'TestApp::Controller::view_all' }

ok( request('/view_all')->is_success, 'Request should succeed' );
done_testing();
