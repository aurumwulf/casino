require 'colorize'
#require 'pry'
#require_relative 'deck'
#require_relative 'player'

#class War

  #def initialize
    @rank = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    @rounds = []
    @user_win = []
    @dealer_win = []

  def generate_cards
      @user = @rank.sample
      puts "----------------------"
      puts "Your card is #{@user}".yellow
      puts "----------------------"
      puts "Press ENTER to see Dealer's card".yellow
      puts "----------------------"
      gets.chomp
      @dealer = @rank.sample
      puts "Dealer drew #{@dealer}".yellow
      result
  end

  def result
    case result
    when @user > @dealer
      @user_win.push(@user)
      @rounds.push(@user)
      puts "----------------------".green
      puts "You win!".green
      puts "----------------------".green
      play_again
    when @user == @dealer
      puts "----------------------".red
      puts "!!!WAR!!!".blue
      puts "----------------------".green
      play_again
    when @user < @dealer
      @dealer_win.push(@dealer)
      @rounds.push(@dealer)
      puts "----------------------".red
      puts "Sorry you lose!".red
      puts "----------------------".red
      play_again
    else
      puts "error"
    end
  end

    def play_again
      puts @rounds.length
      puts "Next Round! Press ENTER!"
      gets.chomp
      if @rounds.length <= 5
        result
      elsif @rounds.length > 5
        the_damage
      else
        puts "error"
      end
    end

    def the_damage
      case the_damage
      when @user_win.length > @dealer_win.length
        #@wallet +=@bet
        #puts "You win #{@bet}"
        puts "You win the GAME!".green
        prompt
      when @user_win.length < @dealer_win.length
        #@wallet -=@bet
        #puts "You lose #{@bet}"
        puts "You are a LOSER!".red
        prompt
      else
        puts "error"
      end
    end

    def prompt
      puts "What's next?"
      puts "1) Play again"
      puts "2) Back to Casino"
      choice = gets.to_i
      case choice
      when 1
        result
      when 2
        puts "temporary placeholder"
        #@casino.menu(@wallet)
      else
        puts "Invalid selection, try again".red
      end
    end

generate_cards
