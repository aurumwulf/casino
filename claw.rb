#player picks claw from casino menu, #2
#money to be withdrawn from wallet to play claw
#win or try again up to 2 more times - loop
# input more money or exit to main menu






require_relative 'Casino'
require_relative 'Player'
require_relative 'Wallet'

class Claw
def menu
  puts "~~~Claw~~~"
  puts "1) Begin game"
  puts "2) Exit"
  user_input = gets.strip.to_i
end

def choice
    case user_input
    when 1 
     #under construction
    when 2 
      #go to main menu
    else 
      puts "Bad user input. Try again"
      menu
    end
end







menu
choice