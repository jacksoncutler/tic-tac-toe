require_relative '../lib/board'

describe 'A Tic Tac Toe board' do

  let(:board) { Board.new }

  let(:empty_board) {
    {
      top: {left: nil, middle: nil, right: nil},
      middle: {left: nil, middle: nil, right: nil},
      bottom: {left: nil, middle: nil, right: nil}
    }
  }

  let(:full_board) {
    {
      top: {left: :fake, middle: :fake, right: :fake},
      middle: {left: :fake, middle: :fake, right: :fake},
      bottom: {left: :fake, middle: :fake, right: :fake}
    }
  }

  it 'exists' do
    Board.new
  end

  it 'can be passed a board' do
    Board.new(empty_board)
  end

  it 'responds to locations' do
    expect(board).to respond_to(:locations)
  end

  it 'begins with empty board' do
    expect(board.locations).to eq(empty_board)
  end

  it 'can place a token' do
    board.place(:fake,:top,:left)
    expect(board.locations).not_to eq(empty_board)
  end

  it 'can return placement of token' do
    expect(board.token_at :top, :left).to eq(nil)
  end

  it 'can reset board' do
    board.place(:fake,:top,:left)
    board.reset
    expect(board.locations).to eq(empty_board)
  end

  it 'can test if board is empty' do
    expect(board.empty?).to be_truthy
    board.place(:fake,:top,:left)
    expect(board.empty?).to be_falsy
  end

  it 'can test if board is full' do
    expect(board.full?).to be_falsy
    expect(Board.new(full_board).full?).to be_truthy
  end

end
