require_relative 'table'

class Roulette

  def initialize
    @number_list = []
  end

  def generate_table
  end

  def generate_red
    numbers_red = [1, 3, 5, 7, 9, 12, 14, 16, 18, 21, 23, 25, 27, 28, 30, 32, 34, 36]
    color = 'red'
    numbers_red.each do |number|
      @number_list << Table.new(number, color)
    end
    puts @number_list
  end

  def generate_black
  end

  def generate_zero
  end
end
