require_relative './config/environment'

use Rack::MethodOverride

use CustomersController
use ReservationController
use RestaurantsController
run ApplicationController
