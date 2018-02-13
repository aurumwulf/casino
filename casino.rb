require 'pry'
require 'colorize'
require_relative 'player'
require_relative 'slots'
require_relative 'roulette'
require_relative 'scratcher'
#require_relative every game file name

class Casino
  attr_accessor :player, :options

  def initialize
    puts
    puts "--\u{2663}-\u{2666}--Welcome to the Casino!--\u{2665}-\u{2660}--".green
    puts
    @player = Player.new
<<<<<<< HEAD
    @wallet = @player.wallet.amount
    @options = ["Slots", "Roulette", "Claw", "Scratcher","Leave the Casino"]
    puts "--\u{2663}-\u{2666}--Choose a game!--\u{2665}-\u{2660}--".green
    puts
    menu
=======
    wallet = @player.wallet.amount
    @options = ["Slots", "Roulette", "Claw", "Scratcher"]
    puts "--\u{2663}-\u{2666}--Choose a game!--\u{2665}-\u{2660}--".green
    menu(@wallet)
>>>>>>> 5193a89cf7fa4a5b8b4a4f8b57a029af6f202ebd
  end

  def menu (wallet)
    @options.each_with_index { |opt, i| puts "#{i + 1}) #{opt}" }
    puts "You currently have $#{'%.2f' % wallet}.".green
    choice = gets.to_i
    case choice
    when 1
<<<<<<< HEAD
      Slots.new
    when 2
      Roulette.new
    when 3
      Claw.rb
    when 4
      Scratcher.new
=======
        Slots.new
    when 2
        Roulette.new(wallet, self)
    when 3
        Claw.new
    when 4
        Scratcher.new
>>>>>>> 5193a89cf7fa4a5b8b4a4f8b57a029af6f202ebd
    when 5
        puts "Come back soon!"
        exit
    else
        puts "Not a Valid choice"
    end
    menu
  end
end

Casino.new
