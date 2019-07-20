require 'byebug'

class Node
  attr_accessor :children, :parent, :value

  def initialize(value)
    @value = value
    @children = []
    @parent = nil
  end

  def add_child(children_arr)
    children_arr.each {|child| child.parent = self}
    self.children += children_arr
  end

  def bfs(target)
    q = [self]
    until q.empty?
      current_node = q.shift
      return current_node if current_node.value == target
      current_node.children.each do |child|
        return child if child.value == target
        q += child.children
      end
    end
    nil
  end
end

a = Node.new('A')
b = Node.new('B')
c = Node.new('C')
d = Node.new('D')
e = Node.new('E')
f = Node.new('F')
g = Node.new('G')
h = Node.new('H')

a.add_child([b,c])
b.add_child([d,e])
c.add_child([f,g])
g.add_child([h])

p a.bfs("H")
