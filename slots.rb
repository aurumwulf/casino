# has bugs
require 'pry'
require 'colorize'
require_relative 'player'

class Slots
attr_accessor :bet, :player

  def initialize(bet, player)
    @bet = (0)
    puts "==============================================="
    puts "Slot Machine is in effect"
    puts "Match two any suit and win your bet x2"
    puts "Match all three of any suit and win your bet x100"
    puts "==============================================="
    puts "1) Play the slots"
    puts "2) Exit to the main hall"
    play = gets.strip.to_i
    case play
    when 1
      menu(player)
    when 2 
      Casino.new
    else
      puts "Not a valid input"
    end  
  end

  def menu(player, bet)
    arr1 = ["\u{2660}".yellow, "\u{2663}".green, "\u{2666}".magenta, "\u{2665}".red]
    arr2 = ["\u{2660}".yellow, "\u{2663}".green, "\u{2666}".magenta, "\u{2665}".red]
    arr3 = ["\u{2660}".yellow, "\u{2663}".green, "\u{2666}".magenta, "\u{2665}".red]
    puts "The minimum bet is $2.00. you have $#{player.wallet}."
    puts "Place your bet now."
    @bet = gets.strip.to_i
    case @bet
    when player.wallet.amount < @bet
    puts "Not enough money to cover your bet"
    when @bet < 2
    puts "MINIMUM BET $2.00!"
    initialize(player)
    else @bet > 5
    puts "\n"
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
      player.wallet.amount += (@bet*2)
      initialize(player)
    when f == s && s == t
      puts "JACKPOT!"
      player.wallet.amount += (@bet*100)
      initialize(player)
    else f != s
      puts "You lose."
      player.wallet.amount -= @bet
      initialize(player)
    end
    menu(player)
    end
  end
end




