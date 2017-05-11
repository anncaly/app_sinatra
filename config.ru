# require './app_sinatra'
#
# run Sinatra::Application

root = File.expand_path File.dirname(__FILE__)
require File.join( root , 'app_sinatra.rb' )

app = Rack::Builder.app do
  run AppModule::App
end

run app
