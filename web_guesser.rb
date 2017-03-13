require 'sinatra'
require 'sinatra/reloader'

def initialize
  @secret_number = rand(100)
end

def check_guess(number)
  if number == 0
    return "Enter a number 1-100 please"
  elsif number == @secret_number
    return "You got it right!"
  elsif number > @secret_number && number > (@secret_number + 5)
    return "WAY too high!"
  elsif number < @secret_number && number < (@secret_number - 5)
    return "WAY too low!"
  elsif (@secret_number..(@secret_number + 5)).include?(number)
    return "Too high!"
  elsif ((@secret_number - 5)..@secret_number).include?(number)
    return "Too low!"
  else
    return "Ummm, I'm not so sure that's a number."
  end
end

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  erb :index, :locals => {:secret_number => @secret_number, :message => message}
end
