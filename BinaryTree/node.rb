
#10:51
#    _____SPECS______
# #1 the left subtree of a node contains only vlaues that
# are less than or equal to the node's value.
# #2 the right subtree only contains values that are great than or
# equal to the node's value.
# #3 both left and right are binary search trees


class Node
  attr_accessor :value, :left, :right

  def initialize(v, c = nil, p = nil)
    @value = v
    @left = nil
    @right = nil
  end


  def insert(v)
    case @value <=> v
    when 1 then insert_left(v)
    when -1 then insert_right(v)
    when 0 then false
    end
  end

  def insert_left(v)
    puts "left"
    if @left
      @left.insert(v)
    else
      self.left = Node.new(v)
    end
  end

  def insert_right(v)
    puts "right"
    if @right
      right.insert(v)
    else
      self.right = Node.new(v)
    end
  end

  def include?(v)
    case @value <=> v
    when 1 then left.include?(v)
    when -1 then right.include?(v)
    when 0 then true
    end
  end





end

array = [4,2,3,232,43,24,34,654,2,5,6,8,9,45,7,9,7,65,565,4,4]
tree = Node.new(array.first)
array.each {|ele| tree.insert(ele)}
puts tree.value
