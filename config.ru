require './config/environment'

use Rack::MethodOverride
use UsersController
use TestcasesController
use FeaturesController
run ApplicationController
