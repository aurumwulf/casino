require_relative 'wallet'

class Player

  attr_accessor :name, :age, :wallet

  def initialize
    @age = age
    puts "What is your name?"
    @name = gets.strip
    puts 'What is your age?'
    @age = gets.to_i
    if @age < 21
      puts 'NO CHILDREN ARE ALLOWED! YES, YOU ARE UNDER 21.'.red
      exit
    end
    puts 'How much money are you playing with?'
    amount = gets.to_f
    @wallet = Wallet.new(amount)
  end
end
