require_relative 'board'

class Game

  attr_accessor :board

  def initialize(board=nil)
    @board = board
  end

  def over?
  end

end
