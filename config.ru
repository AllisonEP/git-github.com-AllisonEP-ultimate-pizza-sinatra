require './config/environment'

use Rack::MethodOverride
use SessionsController
use PizzaParloursController
run ApplicationController
