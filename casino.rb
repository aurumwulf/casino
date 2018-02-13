require 'pry'
require 'colorize'
require_relative 'player'
require_relative 'slots'
require_relative 'roulette'
require_relative 'scratcher'
require_relative 'acey_deucey'  
require_relative 'turtlerace'
#require_relative every game file name

class Casino
  attr_accessor :player, :options

  def initialize
    puts
    puts "--\u{2663}-\u{2666}--Welcome to the Casino!--\u{2665}-\u{2660}--".green
    puts
    @player = Player.new
    wallet = @player.wallet.amount
    @options = ["Slots", "Roulette", "Turtle Race", "Scratcher", "Acey-Deucey", "Leave"]
    menu(wallet)
  end

  def menu (wallet)
    puts "--\u{2663}-\u{2666}--Choose a game!--\u{2665}-\u{2660}--".green
    @options.each_with_index { |opt, i| puts "#{i + 1}) #{opt}" }
    puts "You currently have $#{'%.2f' % wallet}.".green
    choice = gets.to_i
    case choice
    when 1
        Slots.new(wallet, self)
    when 2
        Roulette.new(wallet, self)
    when 3
        TurtleRace.new(wallet, self)
    when 4
        Scratcher.new(wallet, self)
    when 5
        Acey_Deucey.new(wallet, self)
    when 6
        puts "Come back soon!"
        exit
    else
        puts "Not a Valid choice"
    end
    menu(wallet)
  end
end

Casino.new
