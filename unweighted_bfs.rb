# Node Types:
S = 'starting_point'
D = 'destination'
C = 'clear'
B = 'blocked'

# Node:

class Node
  attr_accessor :coordinates, :adjacent_nodes, :visited, :node_type, :cost

  def initialize(coordinates, node_type)
    @coordinates = coordinates # [0,3] => corrdinates within matrix. Example: matrix[0,3] = matrix[0][3]
    @adjacent_nodes = [] # => [[0,1], [1,0]] => [adj_node, adj_node]
    @visited = false # Visited or not. Boolean values.
    @node_type = node_type # Type of node.
    @cost = 0 # Int value
  end

end

# Matrix

class Matrix
  attr_accessor :matrix, :starting_point, :destination, :to_from_cost

  def initialize(matrix)
    @to_from_cost = []
    height = matrix.length
    width = matrix[0].length
    @matrix, @starting_point, @destination = matrix_config(matrix, height, width)
    define_adjacent_nodes(height, width)
  end

  def define_adjacent_nodes(height, width)
    for i in 0...height
      for j in 0...width
        if (i == 0) and (j == 0) and @matrix[i][j].node_type != B
        # TOP LEFT
          top_left_adjacent_nodes(i,j)

        elsif (i == 0) and (j > 0 and j < width - 1) and @matrix[i][j].node_type != B
        # TOP MIDDLE
          top_middle_adjacent_nodes(i,j)

        elsif (i == 0) and (j == width - 1) and @matrix[i][j].node_type != B
        # TOP RIGHT
          top_right_adjacent_nodes(i,j)

        elsif (i > 0 and i < height - 1) and (j == 0) and @matrix[i][j].node_type != B
        # LEFT
          left_adjacent_nodes(i,j)

        elsif (i == height - 1) and (j == 0) and @matrix[i][j].node_type != B
        # BOTTOM LEFT
          bottom_left_adjacent_nodes(i,j)

        elsif (i > 0 and i < height - 1) and (j == width - 1) and @matrix[i][j].node_type != B
        # RIGHT
          right_adjacent_nodes(i,j)

        elsif (i == height - 1) and (j == width - 1) and @matrix[i][j].node_type != B
        # BOTTOM RIGHT
          bottom_right_adjacent_nodes(i,j)

        elsif (i == height - 1) and (j > 0 and j < width - 1) and @matrix[i][j].node_type != B
        # BOTTOM MIDDLE
          bottom_middle_adjacent_nodes(i,j)

        elsif (i > 0 and i < height - 1) and (j > 0 and j < width -1) and @matrix[i][j].node_type != B
        # MIDDLE
          middle_adjacent_nodes(i,j)
        end
      end
    end
  end

  # Adjacent Functions

  def top_left_adjacent_nodes(i,j)
    right(i,j)
    bottom(i,j)
  end

  def top_middle_adjacent_nodes(i,j)
    left(i,j)
    bottom(i,j)
    right(i,j)
  end

  def top_right_adjacent_nodes(i,j)
    left(i,j)
    bottom(i,j)
  end

  def left_adjacent_nodes(i,j)
    top(i,j)
    right(i,j)
    bottom(i,j)
  end

  def bottom_left_adjacent_nodes(i,j)
    top(i,j)
    right(i,j)
  end

  def right_adjacent_nodes(i,j)
    top(i,j)
    left(i,j)
    bottom(i,j)
  end

  def bottom_right_adjacent_nodes(i,j)
    top(i,j)
    left(i,j)
  end

  def bottom_middle_adjacent_nodes(i,j)
    left(i,j)
    top(i,j)
    right(i,j)
  end

  def middle_adjacent_nodes(i,j)
    top(i,j)
    left(i,j)
    right(i,j)
    bottom(i,j)
  end

  # Directional Paths: right, left, top, bottom

  def right(i,j)
    @matrix[i][j].adjacent_nodes << [i, j+1] if @matrix[i][j+1].node_type != B
  end

  def left(i,j)
    @matrix[i][j].adjacent_nodes << [i, j-1] if @matrix[i][j-1].node_type != B
  end

  def top(i,j)
    @matrix[i][j].adjacent_nodes << [i-1, j] if @matrix[i-1][j].node_type != B
  end

  def bottom(i,j)
    @matrix[i][j].adjacent_nodes << [i+1, j] if @matrix[i+1][j].node_type != B
  end

  # Matrix Configuration

  def matrix_config(matrix, height, width)
    starting_point = []
    destination = []
    new_arr = []
    inner_arr = []
    for i in 0...height
      for j in 0...width
        inner_arr = [] if j == 0
        m = matrix[i][j]
        if m == C
          inner_arr << Node.new([i,j], C)
        elsif m == B
          inner_arr << Node.new([i,j], B)
        elsif m == S
          starting_point = [i,j]
          inner_arr << Node.new([i,j], S)
        elsif m == D
          destination = [i,j]
          inner_arr << Node.new([i,j], D)
        end
      end
      new_arr << inner_arr
    end
    return new_arr, starting_point, destination
  end

  def bfs
    queue = [@starting_point]
    a,b  = starting_point
    matrix[a][b].visited = true
    cost = 1
    until queue.empty?
      current_coordinates = queue.shift
      i,j = current_coordinates
      current_node = matrix[i][j]
      current_node.adjacent_nodes.each do |adj_coordinates|
        x,y = adj_coordinates
        adj_node = @matrix[x][y]
        if !adj_node.visited
          adj_node.cost = current_node.cost + 1
          adj_node.visited = true 
          queue << adj_coordinates
        end
        add_to_from_cost(current_node, adj_node)
      end
    end
    shortest_path = find_shortest_path
    puts
    puts "Shortest Path To Destination: #{shortest_path.length - 1} steps"
  
    display_matrix(shortest_path)
  end

  def display_matrix(shortest_path)
    puts
    @matrix.each do |row|
      row.each do |node|
        if node.node_type == C
          if shortest_path.include?(node.coordinates)
            print "X"
          else
            print "C"
          end
        elsif node.node_type == B
          print "B"
        elsif node.node_type == S
          print "S"
        elsif node.node_type == D
          print "D"
        end
      end
      puts
    end
    puts
  end

  def find_shortest_path
    shortest_path = [@destination]
    while !shortest_path.include?(@starting_point)
      i,j = shortest_path.last
      @to_from_cost.each do |cell|
        shortest_path << cell[:"#{i}#{j}"][:from] if cell[:"#{i}#{j}"] != nil
      end
    end
    shortest_path
  end

  def add_to_from_cost(current_node, adj_node)
    i,j = adj_node.coordinates # [2,0] => TO: :"20"
    x,y = current_node.coordinates # [1,0] => FROM: [1,0]
    node_found = nil
    if @to_from_cost.length > 0
      @to_from_cost.each { |cell| node_found = true if !cell[:"#{i}#{j}"].nil?}
    end
    if node_found.nil?
      cost = adj_node.cost # COST: 2
      @to_from_cost << {"#{i}#{j}": {from: [x,y], cost: cost}}
    end
  end


end


matrix = [
 [S,C,C,C,C,C,C,C,C,C], # 0
 [C,B,B,C,C,B,C,B,B,B], # 1
 [C,C,C,C,C,B,C,B,C,B], # 2
 [B,B,C,B,B,B,C,B,C,B], # 3
 [C,C,C,C,C,B,C,B,C,C], # 4
 [B,B,B,C,B,B,C,B,C,C], # 5
 [C,C,C,C,B,B,B,B,C,C], # 6
 [C,C,B,B,B,B,D,B,C,C], # 7
 [C,C,C,C,C,B,C,C,C,C], # 8
 [C,C,C,C,C,C,C,C,C,C]  # 9
# 0 1 2 3 4 5 6 7 8 9
]

shortest_path = Matrix.new(matrix)
shortest_path.bfs
