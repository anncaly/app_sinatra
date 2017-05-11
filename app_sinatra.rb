require 'sinatra'

require 'sinatra/namespace'

require 'sinatra/base'

module AppModule
  class App < Sinatra::Base
    register Sinatra::Namespace

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
  end
end


