require 'pry'
require 'colorize'
require_relative 'player'
require_relative 'slots'
#require_relative every game file name

class Casino
  attr_accessor :player, :options

  def initialize
    puts
    puts "--\u{2663}-\u{2666}--Welcome to the Casino!--\u{2665}-\u{2660}--".green
    puts
    @player = Player.new
    puts "--\u{2663}-\u{2666}--Choose a game!--\u{2665}-\u{2660}--".green
    puts
    @options = [, "Slots"]
    menu
  end

  def menu
    @options.each_with_index { |opt, i| puts "#{i + 1}) #{opt}" }
    choice = gets.to_i
    case choice
    when 1
        Slots.new
    when 2
        #menu options
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
