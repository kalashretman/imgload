require './app'
require 'rack/contrib'

use Rack::PostBodyContentTypeParser

run App
