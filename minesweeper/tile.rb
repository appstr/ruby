class Tile
  attr_reader :value
  attr_accessor :bombs_touching, :revealed, :flagged

  def initialize
    vals = %w(O O O O O O O O O X)
    @value = vals[rand(10)]
    @bombs_touching = 0
    @flagged = false
    @revealed = false
  end
end
