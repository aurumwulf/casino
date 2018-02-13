require 'pry'
require 'colorize'
require_relative 'player'

class Acey_Deucey

    def initialize
        @cards = %w(1 2 3 4 5 6 7 8 9 10 11 12 13)
        @bet = [0]
        puts 'Acey-Deucey is Now Playing'
        puts "Two cards will be dealt. Add your bet to the pot. Guess if the third card will numerically fall in between the first two."
        puts '1) Start Acey_Deucey'
        puts '2) Exit to the Main Hall'
        user_choice = gets.strip.to_i
        case user_choice
        when 1
            menu()
        when 2
            Casino.new
        else
            puts 'Bad User Input'
        end
    end

    def menu
        puts '~~~~ Here We Go!~~~~'; sleep (1)
        puts "The two cards dealt were #{@cards.sample(2)}"; sleep (1)
        puts 'Add your bet to the pot.'
        # puts "The minimum bet is $2.00. You have $#{@wallet}"
        # @bet = gets.strip.to_i
        # case @bet
        # when @wallet < @bet
        #     puts "Not enough money to cover your bet"
        # when @bet < 2
        #     puts "Minimum Bet is $2.00."
        # else @bet > 5
        #     puts "\n"; sleep (1)
        # end
        @third = @cards.sample(1)
        puts "The third card is #{@third}"
        

    end
end

start = Acey_Deucey.new
start

