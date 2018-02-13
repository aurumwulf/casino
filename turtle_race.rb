require 'pry'
require 'colorize'
require_relative 'player'

class TurtleRace
  attr_accessor :player, :wallet


  def initialize (wallet, casino)
    @array_2 = ["Snapping Turtle", "Box Turtle", "Painted Turtle", "Wood Turtle"]
    @wallet = wallet
    @casino = casino
    menu
  end

  def menu
    puts " "
    puts "~ ~ ~ Welcome to Turtle Racing ~ ~ ~".colorize (:green)
    puts "Place your winning bet and double your money!"
    puts "Minimum bet $10"
    puts "~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~".colorize (:green)
    puts " "
    puts "Select 1 to play".colorize (:yellow)
    puts "Select 2 to exit and go back to the Casino".colorize (:yellow)
    choice = (gets.to_i)
    case choice
    when 1
      play_game
    when 2
      puts "Ciao!"
      @casino.menu(@wallet)
    else
      puts "Invalid Choice".colorize (:red)
      menu
    end

  end


  def play_game
   
    puts "Which turtle would you like to bet on?".colorize (:green)
    @array_2.each_with_index { |opt, i| puts "#{i + 1}) #{opt}" }

    choice = gets.to_i
    turtle = @array_2[choice - 1]
    puts "You chose #{turtle}!"
    puts "Enter your bet".colorize (:green)
    @bet = gets.to_f
    result = @array_2.sample
    puts "The winner is the #{result}!".colorize (:magenta)
    if turtle == result
      @wallet += @bet*2
      puts "Congratulations! You've won!".colorize (:magenta)
    else 
      puts "Too slow. Better luck next time.".colorize (:light_blue)
      @wallet -= @bet
    end
    menu
  end
end
