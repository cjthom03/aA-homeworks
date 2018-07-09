# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.

require_relative "bst_node"

class BinarySearchTree
  attr_reader :root

  def initialize
    @root = nil
  end

  def root=(node)
    raise "Type Error" unless node.class == BSTNode
    @root = node
  end

  def insert(value)
    new_node = BSTNode.new(value)
    return @root = new_node if @root.nil?
    find_and_insert(@root, new_node)
    new_node
  end

  def find(value, node = @root)
    return nil unless node
    return node if node.value == value
    value < node.value ? find(value, node.left) : find(value, node.right)
  end

  def delete(value)
    node, child = find(value), nil
    return nil unless node

    if node.left && node.right
      child = maximum(node.left)
      child.right = node.right
      node.right.parent = child
      reset_parent(child.left, child)
    elsif node.left || node.right
      child = node.left || node.right
    end

    reset_parent(child, node)
    remove_node(node)
  end

  # helper method for #delete:
  def maximum(node = @root)
    return node unless node.right
    maximum(node.right)
  end

  def depth(node = @root)
    return 0 if !node || !node.left && !node.right
    [depth(node.left) + 1, depth(node.right) + 1].max
  end

  def is_balanced?(node = @root)
    diff = depth(node.left) - depth(node.right)
    return false if diff.abs > 1

    left = node.left ? is_balanced?(node.left) : true
    right = node.right ? is_balanced?(node.right) : true

    left && right
  end

  def in_order_traversal(node = @root, arr = [])
    in_order_traversal(node.left, arr) if node.left
    arr << node.value
    in_order_traversal(node.right, arr) if node.right

    arr
  end


  private

  def remove_node(node)
    node.left, node.right, node.parent = nil, nil, nil
  end

  def reset_parent(child, deleted_node)
    parent = deleted_node.parent
    child.parent = parent if child
    if !parent
      @root = child
    elsif deleted_node.value > parent.value
      parent.right = child
    else
      parent.left = child
    end
  end

  def find_and_insert(parent, node)
    compare = node.value <=> parent.value
    left = parent.left
    right = parent.right

    case compare
    when -1
      left ? find_and_insert(left, node) : insert_at!(parent, node, :left)
    when 0
      left ? insert_duplicate(parent, node) : insert_at!(parent, node, :left)
    when 1
      right ? find_and_insert(right, node) : insert_at!(parent, node, :right)
    end
  end

  def insert_at!(parent, new_node, location)
    new_node.parent = parent
    location == :left ? parent.left = new_node : parent.right = new_node
  end

  def insert_duplicate(parent, new_node)
    left_tree = parent.left

    parent.left = new_node
    new_node.parent = parent
    left_tree.parent = new_node
    new_node.left = left_tree
  end

end
