class BTree
  attr_accessor :node_value, :left_node, :right_node
#initialize the Btree class and set root node to node_value
#also initialize left_node and right_node node to nil
  def initialize(node_value)
    self.node_value = node_value
    @left_node = nil
    @right_node = nil
  end
#the push method add the new node in the tree
  def push(value)
    compare = self.node_value <=> value
    if compare == 0
      puts "Duplicate value #{value}"
    elsif compare == -1
      if self.right_node == nil
        self.right_node = BTree.new value
      elsif self.right_node != nil
        self.right_node.push value
      end
    elsif compare == 1
      if self.left_node == nil
        self.left_node = BTree.new value
      elsif self.left_node != nil
        self.left_node.push value
      end
    end
  end
#include? method finds the given value is in the tree or not
#if tree has the given node value it will return true and if not the it will
#return false
  def include?(value)
    compare = self.node_value <=> value
    if compare == 0
      return true
    elsif compare == -1 and self.right_node != nil
      self.right_node.include? value
    elsif compare == 1 and self.left_node !=nil
      self.left_node.include? value
    else
      return false
    end
  end
end
