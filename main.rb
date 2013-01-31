require 'rainbow'
require 'pry'
require 'pry-debugger'
require_relative 'functions.rb'

input = menu

while input != 'q'
  if input == 't'
    train
  else
    error
  end
  input = menu
end
puts "You have quit the application".color(:red)