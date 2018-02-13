# fix wallet and return to main menu
require 'pry'
require 'colorize'
require_relative 'player'

class Scratcher
    attr_accessor :casino, :bet

    def initialize(wallet, casino)
        @wallet = wallet
        @casino = casino
        @bet = 0
        menu
    end

    def equations
        puts "SCRATCH SCRATCH SCRATCH..."
        arr1 = [1, 2, 3, 4, 5, 6, 100, 0, 0, 0, 0, 0, 0,]
        num = arr1.sample
        puts "You win $#{num}"
        @wallet = @wallet + num
        puts "Play again Y/N?"
        choice = gets.strip.downcase
        case choice
        when "y"
            menu
        else
            @casino.menu(@wallet)
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
            @casino.menu(@wallet)
        end
    end

    def stage_2
        puts "Type Go to scratch a ticket."
        puts "Remember 1 scratcher is $1"
        start = gets.strip.downcase
        case start
        when 'go'
            @wallet - 1.0
            equations
        else
            menu
        end
    end
end
