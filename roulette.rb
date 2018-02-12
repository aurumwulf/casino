require_relative 'table'

class Roulette

  attr_accessor :number_list

  def initialize
    @number_list = []
    generate_red
    generate_black
    generate_zero
  end

  def generate_red
    numbers_red = [1, 3, 5, 7, 9, 12, 14, 16, 18, 21, 23, 25, 27, 28, 30, 32, 34, 36]
    color = 'red'
    numbers_red.each do |number|
      @number_list << Table.new(number, color)
    end
  end

  def generate_black
    numbers_black = [2, 4, 6, 8, 10, 11, 13, 15, 17, 19, 20, 22, 24, 26, 29, 31, 33, 35]
    color = 'black'
    numbers_black.each do |number|
      @number_list << Table.new(number, color)
    end
  end

  def generate_zero
    numbers_zero = ['0', '00']
    color = 'green'
    numbers_zero.each do |number|
      @number_list << Table.new(number, color)
    end
  end
end

@start = Roulette.new
@start
