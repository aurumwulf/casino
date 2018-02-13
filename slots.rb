# needs to be called then will work
require 'pry'
require 'colorize'
require_relative 'player'

class Slots
attr_accessor :casino, :bet

  def initialize(wallet, casino)
    @wallet = wallet
    @casino = casino
    @bet = 0
    menu
  end

  def menu
    puts "==============================================="
    puts "Slot Machine is in effect"
    puts "Match two any suit and win your bet x2"
    puts "Match all three of any suit and win your bet x5"
    puts "==============================================="
    puts "1) Play the slots"
    puts "2) Exit to the main hall"
    play = gets.strip.to_i
    case play
    when 1
      imp
    when 2
      @casino.menu(@wallet)
    else
      puts "Not a valid input"
    end
  end

  def imp
    arr1 = ["\u{2660}".yellow, "\u{2663}".green, "\u{2666}".magenta, "\u{2665}".red]
    arr2 = ["\u{2660}".yellow, "\u{2663}".green, "\u{2666}".magenta, "\u{2665}".red]
    arr3 = ["\u{2660}".yellow, "\u{2663}".green, "\u{2666}".magenta, "\u{2665}".red]
    puts "The minimum bet is $2.00. you have $#{@wallet}."
    puts "Place your bet now."
    @bet = gets.to_f
    case @bet
    when @wallet < @bet
      puts "Not enough money to cover your bet"
    when @bet < 2
      puts "MINIMUM BET $2.00!"
      menu
    else @bet > 2
      puts "\n"
    end
    f = arr1.sample
    s = arr2.sample
    t = arr3.sample
    print f ; sleep (1)
    print s ; sleep (1)
    puts t ; sleep (1)
    puts "\n"

    case
    when f == s && f != t
      puts "WINNER x2"
      @wallet += (@bet*2)
      menu
    when f == s && s == t
      puts "JACKPOT!"
      @wallet += (@bet*5)
      menu
    else f != s
      puts "You lose."
      @wallet -= @bet
      menu
    end
  end
end