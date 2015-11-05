require 'rubygems'
require 'bundler/setup'

require 'rack/google-analytics'
use Rack::GoogleAnalytics, :tracker => ENV['GA_CODE']

require './app'
run Sinatra::Application
