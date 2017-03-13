require 'sinatra'
require 'sinatra/reloader'

secret_num = rand(101)

get '/' do
  "The SECRET NUMBER is #{secret_num}"
end
