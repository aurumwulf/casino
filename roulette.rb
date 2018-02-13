require 'colorize'
require_relative 'roulette_table'

class Roulette

  attr_accessor :number_list, :bet, :casino

  def initialize (wallet, casino)
    @number_list = []
    @wallet = wallet
    @casino = casino
    @bet = 0
    generate_red
    generate_black
    generate_zero
    prompt
  end

  def generate_red
    numbers_red = %w(1 3 5 7 9 12 14 16 18 21 23 25 27 28 30 32 34 36)
    color = 'Red'.red
    numbers_red.each do |number|
      @number_list << Table.new(number, color)
    end
  end

  def generate_black
    numbers_black = %w(2 4 6 8 10 11 13 15 17 19 20 22 24 26 29 31 33 35)
    color = 'Black'
    numbers_black.each do |number|
      @number_list << Table.new(number, color)
    end
  end

  def generate_zero
    numbers_zero = %w(0 00)
    color = 'Green'.green
    numbers_zero.each do |number|
      @number_list << Table.new(number, color)
    end
  end

  def prompt
    puts 'Welcome to Roulette!'
    puts 'What would you like to do?'
    puts '1) Bet on Roulette.'
    puts '2) Exit to the main hall.'.red
    choice = gets.to_i
    case choice
      when 1
        play
      when 2
        @casino.menu(@wallet)
      else
        puts 'Invalid menu selection.'.red
    end
    prompt
  end

  def play
    puts "You currently have $#{'%.2f' % @wallet}.".green
    puts 'How much would you like to bet?'
    @bet = gets.to_f
    puts 'What would you like to bet on?'
    puts '1) Number (Payout: 2x Bet)'
    puts '2) Color (Payout: 0.5x Bet)'
    choice = gets.to_i
    case choice
    when 1
      number
    when 2
      color
    else
      puts 'Invalid menu selection.'.red
    end
    prompt
  end

  def number
    puts 'What number would you like to bet on?'
    puts 'Choose 0, 00, or a number between 1-36.'
    choice = gets.strip.to_s # No error handling.
    puts "Your choice is #{choice}."
    result = @number_list.sample
    number = result.number
    puts "Roulette spins to #{number}."
    if choice == number
      @bet = @bet * 2
      @wallet += @bet
      puts "YOU WIN! You receive $#{'%.2f' % @bet}!".colorize(:light_green)
    else
      @wallet -= @bet
      puts "YOU LOSE!".red
    end
  end

  def color
    puts 'What color would you like to bet on?'
    puts 'Choose Red, Black, or Green.'
    choice = gets.strip.to_s.downcase # No error handling.
    puts "Your choice is #{choice}."
    result = @number_list.sample
    color = result.color
    puts "Roulette spins to #{color}."
    if choice == result.color
      @bet = @bet + (@bet * 0.5)
      @wallet += @bet
      puts "YOU WIN! You receive $#{'%.2f' % @bet}!".colorize(:light_green)
    else
      @wallet -= @bet
      puts "YOU LOSE!".red
    end
  end
end
