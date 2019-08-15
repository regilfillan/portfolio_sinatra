require_relative "./config/env.rb"

use Rack::MethodOverride
use SessionController
run ApplicationController

