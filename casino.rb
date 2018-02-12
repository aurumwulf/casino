require 'pry'
require 'colorize'
require_relative 'player'
require_relative 'slots'
require_relative 'roulette'
#require_relative every game file name

class Casino
  attr_accessor :player, :options

  def initialize
    puts
    puts "--\u{2663}-\u{2666}--Welcome to the Casino!--\u{2665}-\u{2660}--".green
    puts
    @player = Player.new
    @wallet = @player.wallet.amount
    @options = ["Slots", "Roulette", "Claw"]
    puts "--\u{2663}-\u{2666}--Choose a game!--\u{2665}-\u{2660}--".green
    menu
  end

  def menu
    @options.each_with_index { |opt, i| puts "#{i + 1}) #{opt}" }
    puts "You currently have $#{'%.2f' % @wallet}.".green
    choice = gets.to_i
    case choice
    when 1
        Slots.new
    when 2
        Roulette.new(@wallet)
    when 3
        Claw.new
    when 4
        puts "Come back soon!"
        exit
    else
        puts "Not a Valid choice"
    end
    menu
  end
end

Casino.new
