require 'pry'
require 'colorize'
require_relative 'player'

class Acey_Deucey

     def initialize (wallet, casino)
        @wallet = wallet
        @casino = casino
        @cards = %w(1 2 3 4 5 6 7 8 9 10 11 12 13)
        main_menu
    end

    def main_menu
        puts 'Acey-Deucey is Now Playing'
        puts "Two cards will be dealt. Add your bet to the pot. Guess if the third card will numerically fall inside or outside the first two."
        puts '1) Start Acey_Deucey'
        puts '2) Exit to the Main Hall'
        user_choice = gets.strip.to_i
        case user_choice
        when 1
            game
        when 2
            @casino.menu(@wallet)
        else
            puts 'Bad User Input'; sleep(1)
        end
    end


    def game
        puts '~~~~ Here We Go!~~~~'; sleep (1)
        @deal1 = @cards.sample(1)[0].to_i
        @deal2 = @cards.sample(1)[0].to_i
        puts "The two cards dealt were #{@deal1}, #{@deal2}"; sleep (1)
        
        @diff = @deal1 - @deal2
        if @diff == 1 || @diff == -1 || @diff == 0
            puts "Bad deal, try again."
        else
            higher = 0
            lower = 0
            if @diff <= -2
                higher = @deal2
                lower = @deal1
            elsif @diff >= 2
                higher = @deal1
                lower = @deal2
            end
            puts "Choose whether the next card will be outside or inside."
            puts "1) Outside"
            puts "2) Inside"
            user_choice = gets.strip.to_i
            if user_choice != 1 and user_choice != 2
                puts "Bad user input."
            end
            puts 'Add your bet to the pot.'
            puts "The minimum bet is $2.00. You have $#{@wallet}"
            @bet = gets.strip.to_i
            case @bet
            when @wallet < @bet
                 puts "Not enough money to cover your bet"
            when @bet < 2
                 puts "Minimum Bet is $2.00."
            else
                 puts "\n"; sleep (1)
            end
            @third = @cards.sample(1)[0].to_i
            result = ""
            puts "The third card is #{@third}"
            if @third == higher || @third == lower
                result = "push" #it's a tie
                puts "It's a push!"
            elsif @third > lower && @third < higher
                result = "inside"
                puts "It was inside #{lower} and #{higher}!"
            elsif @third > higher || @third < lower
                result = "outside"
                puts "It was outside #{lower} and #{higher}!"
            end
            
            if result == "push"
                #they keep their money
            elsif (result == "inside" && user_choice == 2) || (result == "outside" && user_choice == 1)
                #they win, give them whatever they bet
                @wallet = @wallet + @bet
                puts "You win!!"
            else
                #they lose, take their bet
                @wallet = @wallet - @bet
                puts "You lose! Better luck next time."
            end
        end
        #Return to main menu to play again or exit
        main_menu
    end
end

