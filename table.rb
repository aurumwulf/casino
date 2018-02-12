require_relative 'roulette'

class Table
  attr_accessor :number, :color

  def initialize (number, color)
    @number = number
    @color = color
  end
end
