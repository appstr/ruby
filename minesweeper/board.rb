require_relative 'tile'
require 'byebug'

class Board
  attr_reader :grid


  def self.setup_board
    @grid = Array.new(9){Array.new(9){Tile.new}}
    Board.locate_bombs
    @grid
  end

  def initialize
    @grid = Board.setup_board
  end

  def self.locate_bombs
    counter1 = 0
    while counter1 < @grid.length
      counter2 = 0
      while counter2 < @grid[counter1].length
        Board.get_bomb_count(counter1, counter2)
        counter2 += 1
      end
      counter1 += 1
    end
  end

  def self.get_bomb_count(counter1, counter2)
    if counter1 == 0
      # TOP ROW
      Board.top_row(counter1, counter2)
    elsif counter1 < @grid[counter1].length - 1
      # MIDDLE ROWS
      Board.middle_rows(counter1, counter2)
    else
      # BOTTOM ROW
      Board.bottom_row(counter1, counter2)
    end
  end

  def self.top_row(counter1, counter2)
    if counter2 == 0
      # First Element
      # NO TOP - NO LEFTS
      # RIGHT CHECK
      @grid[counter1][counter2].bombs_touching += 1 if Board.bomb_touch?(counter1, (counter2 + 1))
      # DIAGONAL_RIGHT_BOTTOM CHECK
      @grid[counter1][counter2].bombs_touching += 1 if Board.bomb_touch?((counter1 + 1), (counter2 + 1))
      # BELOW CHECK
      @grid[counter1][counter2].bombs_touching += 1 if Board.bomb_touch?((counter1 + 1), counter2)
    elsif counter2 < @grid[counter1].length - 1
      # Middle Elements
      # NO TOPS
      # RIGHT CHECK
      @grid[counter1][counter2].bombs_touching += 1 if Board.bomb_touch?(counter1, (counter2 + 1))
      # DIAGONAL_RIGHT_BOTTOM CHECK
      @grid[counter1][counter2].bombs_touching += 1 if Board.bomb_touch?((counter1 + 1), (counter2 + 1))
      # BELOW CHECK
      @grid[counter1][counter2].bombs_touching += 1 if Board.bomb_touch?((counter1 + 1), counter2)
      # LEFT CHECK
      @grid[counter1][counter2].bombs_touching += 1 if Board.bomb_touch?(counter1, (counter2 - 1))
      # DIAGONAL_LEFT_BOTTOM CHECK
      @grid[counter1][counter2].bombs_touching += 1 if Board.bomb_touch?((counter1 + 1), (counter2 - 1))
    else
      # Last Element
      # NO TOPS - NO RIGHTS
      # BELOW CHECK
      @grid[counter1][counter2].bombs_touching += 1 if Board.bomb_touch?((counter1 + 1), counter2)
      # LEFT CHECK
      @grid[counter1][counter2].bombs_touching += 1 if Board.bomb_touch?(counter1, (counter2 - 1))
      # DIAGONAL_LEFT_BOTTOM CHECK
      @grid[counter1][counter2].bombs_touching += 1 if Board.bomb_touch?((counter1 + 1), (counter2 - 1))
    end
  end

  def self.middle_rows(counter1, counter2)
    if counter2 == 0
      # First Element
      # NO LEFTS
      # RIGHT CHECK
      @grid[counter1][counter2].bombs_touching += 1 if Board.bomb_touch?(counter1, (counter2 + 1))
      # DIAGONAL_RIGHT_BOTTOM CHECK
      @grid[counter1][counter2].bombs_touching += 1 if Board.bomb_touch?((counter1 + 1), (counter2 + 1))
      # DIAGONAL_RIGHT_TOP
      @grid[counter1][counter2].bombs_touching += 1 if Board.bomb_touch?((counter1 - 1), (counter2 + 1))
      # BELOW CHECK
      @grid[counter1][counter2].bombs_touching += 1 if Board.bomb_touch?((counter1 + 1), counter2)
      # TOP CHECK
      @grid[counter1][counter2].bombs_touching += 1 if Board.bomb_touch?((counter1 - 1), counter2)
    elsif counter2 < @grid[counter1].length - 1
      # Middle Elements
      # ALL SPACES AVAILABLE
      # RIGHT CHECK
      @grid[counter1][counter2].bombs_touching += 1 if Board.bomb_touch?(counter1, (counter2 + 1))
      # DIAGONAL_RIGHT_BOTTOM CHECK
      @grid[counter1][counter2].bombs_touching += 1 if Board.bomb_touch?((counter1 + 1), (counter2 + 1))
      # DIAGONAL_RIGHT_TOP
      @grid[counter1][counter2].bombs_touching += 1 if Board.bomb_touch?((counter1 - 1), (counter2 + 1))
      # BELOW CHECK
      @grid[counter1][counter2].bombs_touching += 1 if Board.bomb_touch?((counter1 + 1), counter2)
      # TOP CHECK
      @grid[counter1][counter2].bombs_touching += 1 if Board.bomb_touch?((counter1 - 1), counter2)
      # LEFT CHECK
      @grid[counter1][counter2].bombs_touching += 1 if Board.bomb_touch?(counter1, (counter2 - 1))
      # DIAGONAL_LEFT_BOTTOM CHECK
      @grid[counter1][counter2].bombs_touching += 1 if Board.bomb_touch?((counter1 + 1), (counter2 - 1))
      # DIAGONAL_LEFT_TOP CHECK
      @grid[counter1][counter2].bombs_touching += 1 if Board.bomb_touch?((counter1 - 1), (counter2 - 1))
    else
      # Last Element
      # NO RIGHTS
      # TOP CHECK
      @grid[counter1][counter2].bombs_touching += 1 if Board.bomb_touch?((counter1 - 1), counter2)
      # LEFT CHECK
      @grid[counter1][counter2].bombs_touching += 1 if Board.bomb_touch?(counter1, (counter2 - 1))
      # DIAGONAL_LEFT_BOTTOM CHECK
      @grid[counter1][counter2].bombs_touching += 1 if Board.bomb_touch?((counter1 + 1), (counter2 - 1))
      # DIAGONAL_LEFT_TOP CHECK
      @grid[counter1][counter2].bombs_touching += 1 if Board.bomb_touch?((counter1 - 1), (counter2 - 1))
    end
  end

  def self.bottom_row(counter1, counter2)
    if counter2 == 0
      # First Elemenet
      # NO LEFTS - NO BOTTOMS
      # RIGHT CHECK
      @grid[counter1][counter2].bombs_touching += 1 if Board.bomb_touch?(counter1, (counter2 + 1))
      # DIAGONAL_RIGHT_BOTTOM CHECK
      @grid[counter1][counter2].bombs_touching += 1 if Board.bomb_touch?((counter1 + 1), (counter2 + 1))
      # DIAGONAL_RIGHT_TOP
      @grid[counter1][counter2].bombs_touching += 1 if Board.bomb_touch?((counter1 - 1), (counter2 + 1))
      # TOP CHECK
      @grid[counter1][counter2].bombs_touching += 1 if Board.bomb_touch?((counter1 - 1), counter2)
    elsif counter2 < @grid[counter1].length - 1
      # Middle Elements
      # NO BOTTOMS
      # DIAGONAL_LEFT_TOP CHECK
      @grid[counter1][counter2].bombs_touching += 1 if Board.bomb_touch?((counter1 - 1), (counter2 - 1))
      # DIAGONAL_RIGHT_TOP
      @grid[counter1][counter2].bombs_touching += 1 if Board.bomb_touch?((counter1 - 1), (counter2 + 1))
      # TOP CHECK
      @grid[counter1][counter2].bombs_touching += 1 if Board.bomb_touch?((counter1 - 1), counter2)
      # LEFT CHECK
      @grid[counter1][counter2].bombs_touching += 1 if Board.bomb_touch?(counter1, (counter2 - 1))
      # RIGHT CHECK
      @grid[counter1][counter2].bombs_touching += 1 if Board.bomb_touch?(counter1, (counter2 + 1))
    else
      # Last Element
      # NO RIGHTS - NO BOTTOMS
      # DIAGONAL_LEFT_TOP CHECK
      @grid[counter1][counter2].bombs_touching += 1 if Board.bomb_touch?((counter1 - 1), (counter2 - 1))
      # TOP CHECK
      @grid[counter1][counter2].bombs_touching += 1 if Board.bomb_touch?((counter1 - 1), counter2)
      # LEFT CHECK
      @grid[counter1][counter2].bombs_touching += 1 if Board.bomb_touch?(counter1, (counter2 - 1))
    end
  end

  def self.bomb_touch?(counter1, counter2)
    if !@grid[counter1].nil?
      @grid[counter1][counter2].value == "X"
    end
  end

  def self.render_grid
    puts "  #{(0..8).to_a.join(" ")}"
    @grid.each_with_index do |row, indx|
      counter = 0
      print "#{indx} "
      while counter < row.length
        if row[counter].flagged
          print 'F '
        elsif row[counter].revealed
          if row[counter].bombs_touching == 0
            print "* "
          else
            print "#{row[counter].bombs_touching} "
          end
        else
          print '_ '
        end
        counter += 1
      end
      puts ''
    end
  end

  def self.render_losing_grid
    puts "  #{(0..8).to_a.join(" ")}"
    @grid.each_with_index do |row, indx|
      counter = 0
      print "#{indx} "
      while counter < row.length
        if row[counter].flagged and row[counter].value == "X"
          # SHOW FLAGGED BOMB 'T'
          print 'T '
        elsif row[counter].flagged and row[counter].value == "O"
          # SHOW FLAG 'F'
          print 'F '
        elsif row[counter].value == "X"
          # SHOW BOMB 'X'
          print 'X '
        elsif row[counter].revealed
          # SHOW BOMBS_TOUCHING VALUE
          if row[counter].bombs_touching == 0
            print "* "
          else
            print "#{row[counter].bombs_touching} "
          end
        else
          # SHOW '?'
          print '_ '
        end
        counter += 1
      end
      puts ''
    end
  end

end


# [
# [1,2,3,4,5],
# [1,2,3,4,5],
# [1,2,3,4,5]
# ]
