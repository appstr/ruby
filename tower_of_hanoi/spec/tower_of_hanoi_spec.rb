require 'byebug'
require 'tower_of_hanoi'

describe TowerOfHanoi do
  subject(:t1){TowerOfHanoi.new}
  let(:starting_pegs){[[3,2,1],[],[]]}

  describe '#initialize' do
    it 'has 3 pegs, with 3 rings' do
      expect(t1.pegs).to eq(starting_pegs)
    end

    it 'starts with a move count of 0.' do
      expect(t1.move_count).to eq(0)
    end
  end

  describe '#valid_move?' do
    context 'when valid move' do
      it 'should return true when the "to" value is greater than the "from" value' do
        expect(valid_move(0, 2))
      end
    end
  end


end
