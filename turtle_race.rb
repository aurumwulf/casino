require 'pry'
require 'colorize'
require_relative 'player'

class Turtle_Race
  attr_accessor :player, :walletf

  array_2 = ["Snapping Turtle", "Box Turtle", "Painted Turtle", "Wood Turtle"]

  def initialize (wallet, casino)
    @array_1 = []
    @array_2 = []
    @wallet = wallet
    @casino = casino
    @bet = 0
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
    play_game(gets.to_i)
    #@menu = gets.to_f
  end

  def begin(choice)
    case choice
    when 1 
      play_game
    when 2
      puts "Ciao!"
      Casino.new 
    else
      puts "Invalid Choice".colorize (:red)
      menu.new
    end
  end
  #choice = gets.strip.to_s 


  def play_game
    puts "Which turtle would you like to bet on?".colorize (:green)
    puts "1 ~ Snapping Turtle".colorize (:yellow)
    puts "2 ~ Box Turtle".colorize (:yellow)
    puts "3 ~ Painted Turtle".colorize (:yellow)
    puts "4 ~ Wood Turtle".colorize (:yellow)
    choice = gets.strip.to_s.downcase 
    puts "Enter your bet".colorize (:green)
    @bet = gets.to_f
    @wallet -= @bet
  end


  def win
    puts "The winner is the".colorize (:magenta)
    result = @array_2.sample
    if choice = array_2.sample
      @bet = @bet * 2
      @wallet += @bet
      puts "Congratulations! You've won!".colorize (:magenta)
    else array_1 != arry_2.sample
      puts "Too slow. Better luck next time.".colorize (:light_blue)
    end
    menu
  end
end

 