require 'byebug'

class TowerOfHanoi
  attr_reader :pegs, :move_count
  def initialize
    @pegs = [(1..3).to_a.reverse, [], []]
    @move_count = 0
  end

  def valid_move?(from, to)
    if @pegs[to].last == nil || @pegs[from].last < @pegs[to].last
      return true
    else
      puts "Invalid move! Try again..."
      return false
    end
  end

  def make_move(from, to)
    peg = @pegs[from].pop
    @pegs[to].push(peg)
    @move_count += 1
  end

  def show_board
    print @pegs
  end

  def game_over?
    return true if @pegs[1].length == 3 || @pegs[2].length == 3
  end

  def play_game
    puts show_board
    while !game_over?
      valid_move = false
      while !valid_move
        puts "Move from peg: "
        from = gets.chomp!.to_i - 1
        puts "to peg: "
        to = gets.chomp!.to_i - 1
        valid_move = valid_move?(from, to)
        make_move(from, to) if valid_move
        puts show_board
      end
    end
    puts "Congratulations, you have won the game in #{@move_count} moves!"
  end

end

t = TowerOfHanoi.new
t.play_game
