#class blackjack
#deal two cards to player
#two cards to dealer
#Hit or Stay
#Bust
#Put a variable & value w/in the array
#--J,Q,K are 10.  A ask player if 1 or 11 - Easter Egg
#Replicate for dealer

require_relative 'Card'
require_relative 'Deck'

def menu
  puts "~~~Black Jack~~~"
  puts "1) Deal my cards"
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