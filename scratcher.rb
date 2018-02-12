# still buggy
require 'pry'
require 'colorize'
require_relative 'player'

class Scratcher
    attr_accessor :player, :wallet
    arr = %w[1, 2, 3, 4, 5, 6, 0, 0, 0,]

    def equations
        puts "SCRATCH SCRATCH SCRATCH..."
        num = arr.sample
        puts "You win $#{num}"
        # add the $#{num} to the players wallet
        puts "Play again Y/N?"
        choice = gets.strip.downcase
        case choice
        when "y"
            menu
        else
            Casino.new
        end
    end

    def menu
        puts "Got an Itch? Buy a scratcher!"
        puts "1 scratcher is $1.00"
        puts "1) Play"
        puts "2) Return to casino main"
        play = gets.to_i
        case play
        when 1
            stage_2
        when 2
            Casino.new
        end
    end

    def stage_2
        puts "Type Go to scratch a ticket."
        puts "Remember 1 scratcher is $1"
        start = gets.strip.downcase
        case start
        when go
            #take $1 from the wallet then
            equations
        else
            menu
        end
    end
    
end