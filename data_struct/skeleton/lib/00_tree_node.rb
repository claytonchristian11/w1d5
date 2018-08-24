class PolyTreeNode
  
  attr_reader :parent, :children, :value
  
  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end
  
  def parent=(node)
    if @parent != nil
      @parent.children.delete(self)
    end
    @parent = node
    node.children << self unless node == nil #|| (node.children.include?(self))
  end
  
  def add_child(child_node)
    child_node.parent=(self)
  end
  
  def remove_child(child_node)
    if child_node.parent == nil
      raise "no parents"
    else
    child_node.parent = nil
    end
  end
  
  def dfs(target_value)
    return self if self.value == target_value
    self.children.each do |child|
      result = child.dfs(target_value)
      return result if result
    end 
    nil
  end
  
  def bfs(target_value)
    array = [self]
    until array.empty?
      val1 = array[0].value
      return array[0] if val1 == target_value
      array += array[0].children
      array.shift
    end
  end
  
end