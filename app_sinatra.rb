require 'sinatra'

require 'sinatra/namespace'

require 'sinatra/base'

require 'sequel'
require 'sequel/extensions/seed'
require 'pg'
require 'json'
require 'multi_json'

# module AppModule
#   class App < Sinatra::Base
#     register Sinatra::Namespace


DB = Sequel.connect(
    adapter: :postgres,
    database: 'sinatra_seq_dev',
    host: 'localhost',
    password: 'password',
    user: 'sinatra_admin',
    max_connections: 10,
# logger: Logger.new('log/db.log')
)

%w{controllers models routes}.each {|dir| Dir.glob("./#{dir}/*.rb", &method(:require))}

# второй вариант
#%w{controllers models routes}.each do |dir|
#  $LOAD_PATH << File.expand_path('', File.join(File.dirname(__FILE__).dir))
#  require File.join(dir, 'init')
#end

get '/' do
  'Hello My Sinatra - Easy and Wide World!'
end

get '/hello/name' do
  "Sinatra приветствует тебя, #{params[:name]}!"
end

namespace '/api/v1' do
  get '/*' do
    "I don't know what is the #{params[:splat]}. It's what you typed."
  end
end

get '/v' do
  redirect to('/hello/World')
end

get %r{/hello/([\w]+)} do |c|
  "Hello, #{c}!"
end

get '/say/*/to/*' do
  params[:splat].to_s
end

get '/jobs.?:format?' do
  # соответствует "GET /jobs", "GET /jobs.json", "GET /jobs.xml" и т.д.
  'Rout is working'
end
#   end
# end


