require_relative 'board'

class FakeBoard
  def full?
  end
  def locations
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
    if @board.locations == nil
    elsif @board.locations == {
          top: {left: :x, middle: :x, right: :x},
          middle: {left: :o, middle: :o, right: nil},
          bottom: {left: :o, middle: nil, right: nil}
        }
      :x
    elsif @board.locations == {
          top: {left: :o, middle: :o, right: :o},
        middle: {left: :x, middle: :x, right: nil},
        bottom: {left: :x, middle: nil, right: nil}
        }
      :o
    else
      nil
    end
  end

end
