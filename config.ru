require_relative "./config/env.rb"

use Rack::MethodOverride
use SessionsController
run ApplicationController

