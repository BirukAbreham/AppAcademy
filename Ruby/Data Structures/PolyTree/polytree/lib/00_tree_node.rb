require 'byebug'

class PolyTreeNode

  attr_reader :parent, :value, :children
  
  def initialize(value)
    @parent = nil
    @value = value
    @children = []
  end

  def parent=(parent_node)
    if !parent_node.nil? && self.parent != parent_node
      if !self.parent.nil?
        self.parent.children.delete(self)
      end
      @parent = parent_node
      parent_node.children = self
    else
      @parent = parent_node
    end
  end

  def children=(child_node)
    @children << child_node
  end

  def add_child(child_node )
    child_node.parent = self
  end

  def remove_child(child_node)
    raise 'Node is not a child node' if !self.children.include?(child_node)
    child_node.parent = nil
  end

  def dfs(target_value)
    # debugger
    return self if self.value == target_value
    
    self.children.each do |child|
      result = child.dfs(target_value)
      return result unless result.nil?
    end
    nil
  end
  
  def bfs(target_value)
    queue = [self]
    until queue.empty?
      node = queue.shift
      if node.value == target_value
        return node
      else
        queue = [ *queue, *node.children ]
      end
    end
    nil
  end

end
