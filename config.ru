require 'rubygems'
require 'bundler/setup'

require 'rack/tracker'
use Rack::Tracker do
  handler :google_analytics, { tracker: ENV['GA_CODE'] }
end

require './app'
run Sinatra::Application
