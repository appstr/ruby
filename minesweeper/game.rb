require_relative 'board'
require 'byebug'

class Game
  attr_reader :board

  def initialize
    @board = Board.new
  end

  def win?
    board.grid.each do |row|
      row.each {|tile| return false if tile.value == "O" and !tile.revealed}
    end
    true
  end

  def get_position
    pos = nil
    until pos and valid_position?(pos)
      begin
        puts "Please enter a position (ex: 0,3): "
        pos = gets.chomp.split(",").map(&:to_i)
      rescue => e
        puts "#{e}"
      end
    end
    pos
  end

  def valid_position?(pos)
    pos.length == 2 and pos.all?{|e| e.is_a?(Integer) }
  end

  def get_move(pos)
    move = nil

    until move and valid_move_command?(move, pos)
      begin
        puts "Please enter a move (F: 'Flag', U: 'Unflag', R: 'Reveal', C: 'Cancel'): "
        move = gets.chomp.downcase
        if move == 'c'
          move = false
          break
        end
      rescue => e
        puts "#{e}"
      end
    end
    move
  end

  def valid_move_command?(move, pos)
    valid_moves = %w(f u r)
    move.length == 1 and valid_moves.include?(move) and valid_move?(move, pos)
  end

  def valid_move?(move, pos)
    pos1, pos2 = pos
    if (move == 'r' && board.grid[pos1][pos2].flagged) || (move == 'r' && board.grid[pos1][pos2].revealed)
      return false
    elsif move == 'u' && !board.grid[pos1][pos2].flagged
      return false
    elsif (move == 'f' && board.grid[pos1][pos2].flagged) || (move == 'f' && board.grid[pos1][pos2].revealed)
      return false
    end
    true
  end

  def make_move(pos, move)
    pos1, pos2 = pos
    if move == 'r'
      board.grid[pos1][pos2].revealed = true
      return false if board.grid[pos1][pos2].value == "X"
      # METHOD TO SEARCH AND REVEAL APPROPRIATE CHILD NODES.
      reveal_child_nodes(pos1, pos2)
    elsif move == 'f'
      board.grid[pos1][pos2].flagged = true
    elsif move == 'u'
      board.grid[pos1][pos2].flagged = false
    end
    true
  end

  def reveal_child_nodes(pos1, pos2)
    # DFS into children nodes.
    bg = board.grid[pos1][pos2]
    bg.revealed = true
    if bg.bombs_touching == 0
      children = get_child_node_indexes(pos1, pos2)
      # children => [[0,0], [3,4], [2,8], [0,4]]
      children.each do |child_indx|
        p1, p2 = child_indx
        bg = board.grid
        if bg[p1][p2].bombs_touching > 0 and bg[p1][p2].value == 'O'
          bg[p1][p2].revealed = true
        elsif bg[p1][p2].bombs_touching <= 0 and bg[p1][p2].value == 'O'
          bg[p1][p2].revealed = true
          reveal_child_nodes(p1, p2)
        end
      end
    end
  end

  def get_child_node_indexes(pos1, pos2)
    children = []
    if pos1 == 0
      # FIRST ROW
      children += first_row_search(pos1, pos2)
    elsif pos1 == 8
      # LAST ROW
      children += last_row_search(pos1, pos2)
    else
      # MIDDLE ROWS
      children += middle_row_search(pos1, pos2)
    end
    children
  end

  def first_row_search(pos1, pos2)
    children = []
    if pos2 == 0
      # NO TOPS/LEFTS
      # FIRST ELEMENT
      children << right_indx(pos1, pos2)
      children << bottom_right_indx(pos1, pos2)
      children << bottom_indx(pos1, pos2)
    elsif pos2 == 8
      # NO TOPS/RIGHTS
      # LAST ELEMENT
      children << left_indx(pos1, pos2)
      children << bottom_left_indx(pos1, pos2)
      children << bottom_indx(pos1, pos2)
    else
      # NO TOPS
      # MIDDLE ELEMENT
      children << left_indx(pos1, pos2)
      children << bottom_left_indx(pos1, pos2)
      children << bottom_indx(pos1, pos2)
      children << bottom_right_indx(pos1, pos2)
      children << right_indx(pos1, pos2)
    end
    children.compact
  end

  def last_row_search(pos1, pos2)
    children = []
    if pos2 == 0
      # FIRST ELEMENT
      # NO BOTTOMS/LEFTS
      children << top_indx(pos1, pos2)
      children << top_right_indx(pos1, pos2)
      children << right_indx(pos1, pos2)
    elsif pos2 == 8
      # LAST ELEMENT
      # NO BOTTOMS/RIGHTS
      children << top_indx(pos1, pos2)
      children << top_left_indx(pos1, pos2)
      children << left_indx(pos1, pos2)
    else
      # MIDDLE ELEMENT
      # NO BOTTOMS
      children << left_indx(pos1, pos2)
      children << top_left_indx(pos1, pos2)
      children << top_indx(pos1, pos2)
      children << top_right_indx(pos1, pos2)
      children << right_indx(pos1, pos2)
    end
    children.compact
  end

  def middle_row_search(pos1, pos2)
    children = []
    if pos2 == 0
      # FIRST ELEMENT
      # NO LEFTS
      children << top_indx(pos1, pos2)
      children << top_right_indx(pos1, pos2)
      children << right_indx(pos1, pos2)
      children << bottom_right_indx(pos1, pos2)
      children << bottom_indx(pos1, pos2)
    elsif pos2 == 8
      # LAST ELEMENT
      # NO RIGHTS
      children << top_indx(pos1, pos2)
      children << top_left_indx(pos1, pos2)
      children << left_indx(pos1, pos2)
      children << bottom_left_indx(pos1, pos2)
      children << bottom_indx(pos1, pos2)
    else
      # MIDDLE ELEMENT
      # NO RESTRICTIONS
      children << top_indx(pos1, pos2)
      children << top_left_indx(pos1, pos2)
      children << left_indx(pos1, pos2)
      children << bottom_left_indx(pos1, pos2)
      children << bottom_indx(pos1, pos2)
      children << bottom_right_indx(pos1, pos2)
      children << right_indx(pos1, pos2)
      children << top_right_indx(pos1, pos2)
    end
    children.compact
  end

  def top_indx(pos1, pos2)
    !board.grid[pos1 - 1][pos2].revealed ? [pos1 - 1, pos2] : nil
  end

  def right_indx(pos1, pos2)
    !board.grid[pos1][pos2 + 1].revealed ? [pos1, pos2 + 1] : nil
  end

  def left_indx(pos1, pos2)
    !board.grid[pos1][pos2 - 1].revealed ? [pos1, pos2 - 1] : nil
  end

  def bottom_left_indx(pos1, pos2)
    !board.grid[pos1 + 1][pos2 - 1].revealed ? [pos1 + 1, pos2 - 1] : nil
  end

  def bottom_right_indx(pos1, pos2)
    !board.grid[pos1 + 1][pos2 + 1].revealed ? [pos1 + 1, pos2 + 1] : nil
  end

  def top_left_indx(pos1, pos2)
    !board.grid[pos1 - 1][pos2 - 1].revealed ? [pos1 - 1, pos2 - 1] : nil
  end

  def top_right_indx(pos1, pos2)
    !board.grid[pos1 - 1][pos2 + 1].revealed ? [pos1 - 1, pos2 + 1] : nil
  end

  def bottom_indx(pos1, pos2)
    !board.grid[pos1 + 1][pos2].revealed ? [pos1 + 1, pos2] : nil
  end

  def play
    lost = false
    while !win?
      Board.render_grid
      move = false
      while !move
        pos = get_position
        move = get_move(pos)
      end
      if !make_move(pos, move)
        puts "BOOM!"
        lost = true
        Board.render_losing_grid
        break
      end
    end
    if lost
      puts "YOU LOSE!"
    else
      puts "CONGRATULATIONS, YOU WIN!"
    end
  end

end

g = Game.new
g.play
