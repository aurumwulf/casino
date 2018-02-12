require 'pry'
require 'colorize'
require_relative 'player'

class slot


  def initialize(player)
    puts "Slot Machine is in effect"
    puts "How much would you like to bet??"
    @bet = gets.to_i(round(2))
    

  end
end