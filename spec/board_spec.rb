require_relative '../lib/board'

describe 'A Tic Tac Toe board' do

  let(:board) { Board.new }

  it 'exists' do
    Board.new
  end

  it 'responds to locations' do
    expect(board).to respond_to(:locations)
  end

end
