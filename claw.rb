#player picks claw from casino menu, #2
#money to be withdrawn from wallet to play claw
#win or try again up to 2 more times - loop or case statement?
# - random, draw 1 from array
# input more money or exit to main menu
#color game






require 'pry'
require 'colorize'
require_relative 'Casino'
require_relative 'Player'
require_relative 'Wallet'

class Claw 
#objects: menu, take $ from wallet,
         #random array of icons, play again or exit

  def initialize (wallet, casino)
    claw[]
end

def menu
  puts "~~Claw~~"
  puts "1) Begin game"
  puts "2) Exit to Casino" #want to go back to the casino
  user_input = gets.strip.to_i
end

def choice
  case user_input
  when 1 

  when 2 
      #go to main menu
    else 
      puts "Bad user input. Play again or exit"
      menu
    end
end







menu
choice