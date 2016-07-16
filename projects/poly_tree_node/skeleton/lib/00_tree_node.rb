require 'byebug'
class PolyTreeNode

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def add_child(node)
    # debugger
    if !(@children.include? node)
      @children.push(node)
      node.parent=(self) unless node.parent == self
    end
  end

  def parent=(node)
    #unless node == nil
    @parent.children.delete(self) unless @parent == nil
    node.add_child(self) unless node == nil

    @parent = node
  end

  def remove_child(node)
    child = @children.delete(node)
    child.parent=(nil)
  end

  def dfs (target)
    return self if target == self.value
    return nil if self.children.empty?
     children.each do |child|
      found = child.dfs(target)
        return found unless found.nil?
    end
    nil
  end

  def bfs(target)
    que = []
    que << self
    while !que.empty?
      current_node = que.shift
      return current_node if current_node.value == target
      que += current_node.children
    end
  end


end
