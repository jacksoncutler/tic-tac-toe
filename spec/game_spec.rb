require_relative '../lib/game'

describe 'A game of tic tac toe' do

  let(:full_board) {
    Board.new({
      top: {left: :fake, middle: :fake, right: :fake},
      middle: {left: :fake, middle: :fake, right: :fake},
      bottom: {left: :fake, middle: :fake, right: :fake}
    })
  }

  let(:midgame_board) {
    Board.new({
      top: {left: :o, middle: nil, right: nil},
      middle: {left: nil, middle: :x, right: nil},
      bottom: {left: nil, middle: nil, right: nil}
    })
  }

  let(:x_wins_board) {
    Board.new({
      top: {left: :x, middle: :x, right: :x},
      middle: {left: :o, middle: :o, right: nil},
      bottom: {left: :o, middle: nil, right: nil}
    })
  }

  let(:o_wins_board) {
    Board.new({
      top: {left: :o, middle: :o, right: :o},
      middle: {left: :x, middle: :x, right: nil},
      bottom: {left: :x, middle: nil, right: nil}
    })
  }

  it 'exists' do
    Game.new
  end

  it 'has a board' do
    expect(Game.new).to respond_to(:board)
  end

  it 'can be created with a specific board' do
    fake_board = 'FAKE'
    game = Game.new(fake_board)
    expect(game.board).to eq(fake_board)
  end

  it 'is not initially over' do
    game = Game.new
    expect(game).to_not be_over
  end

  it 'is not over if the board is not full' do
    game = Game.new(midgame_board)
    expect(game).to_not be_over
  end

  it 'is over when the board is full' do
    expect(Game.new(full_board)).to be_over
  end

  it 'is a tie if there is no winner and the board is full' do
    game = Game.new(full_board)
    expect(game).to be_tie
  end

  describe 'winning' do

    it 'reports :x is the winner when a row is full of :x' do
      game = Game.new(x_wins_board)
      expect(game.winner).to eq(:x)
    end

    it 'reports :o is the winner when a row is full of :o' do
      game = Game.new(o_wins_board)
      expect(game.winner).to eq(:o)
    end

    it 'reports nil if there is no winner' do
      game = Game.new
      expect(game.winner).to be_nil
    end

  end

end
