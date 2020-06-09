require_relative 'board'

class FakeBoard
  def full?
  end
end

class Game

  attr_accessor :board

  def initialize(board=FakeBoard.new)
    @board = board
  end

  def over?
    @board.full?
  end

  def tie?
    true
  end

  def winner
  end
  

end
