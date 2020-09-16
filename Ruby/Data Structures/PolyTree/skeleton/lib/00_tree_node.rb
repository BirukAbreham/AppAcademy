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

end
