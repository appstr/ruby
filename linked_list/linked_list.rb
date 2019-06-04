require_relative 'node'

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(value)
    if @head
      last_node.next = Node.new(value)
    else
      @head = Node.new(value)
    end
  end

  def last_node
    node = @head
    return node if !node.next
    while(node = node.next)
      return node if !node.next
    end
  end

  def last_node_value
    last_node.value
  end

  def append_before(target, value)
    if @head.value == target
      n = Node.new(value)
      n.next = @head
      @head = n
      return
    end
    return append_after(@head.value, value) if @head.next.value == target
    return false if !find(target)
    node = @head
    while(node = node.next)
      if node.next.value == target
        n = Node.new(value)
        n.next = node.next
        node.next = n
        return
      end
    end
  end

  def append_after(target, value)
    return @head.next = Node.new(value) if !@head.next
    return false if !find(target)
    node = find(target)
    n = Node.new(value)
    n.next = node.next
    node.next = n
    return
  end

  def append_multiple(arr)
    arr.each {|ele| append(ele)}
    return
  end

  def find(value)
    return @head if @head.value == value
    node = @head
    while(node = node.next)
      return node if node.value == value
    end
    false
  end

  def delete(value)
    @head = @head.next if @head.value == value
    if @head.next.value == value
      @head.next = @head.next.next
      return
    end
    node = @head
    while(node = node.next)
      if node.next.value == value
        node.next = node.next.next
        return
      end
    end
  end

  def length
    return 1 if !@head.next
    counter = 1
    node = @head
    while(node = node.next)
      counter += 1
    end
    counter
  end

  def each_value(&prc)
    node = @head
    new_values = []
    prc ||= Proc.new {|v| v}
    while(node)
      new_values << prc.call(node.value)
      node = node.next
    end
    new_values
  end

  def head_value
    self.head.value
  end

end


# list1 = LinkedList.new
# list1.append(1)
# puts list1.head.value
# list1.append(2)
# puts list1.head.next.value
# list1.append(3)
# puts list1.head.next.next.value
# values = list1.each_value
# print values
# puts
#
# list2 = LinkedList.new
# list2.append_multiple([1,2,3,4,5])
# list2.append_after(2, 2.5)
# print list2.each_value
# puts
# list2.append_before(5, 4.5)
# print list2.each_value
# puts
# list2.append_multiple([6,7,8,9,10])
# print list2.each_value
# puts
# times_two = list2.each_value {|v| v * 2}
# print times_two
# puts
