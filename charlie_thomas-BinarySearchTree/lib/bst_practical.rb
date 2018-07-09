require_relative 'binary_search_tree'

# THIS APPROACH IS WRONG, this is not what the question was asking for

# def kth_largest(tree_node, k)
#   tree_queue = [tree_node]
#   tree_queue.each do |node|
#     break if tree_queue.length == k
#     tree_queue << node.left if node.left
#     tree_queue << node.right if node.right
#   end
#
#   tree_queue[k]
# end


def kth_largest(tree_node, k)
  reverse_order_traversal(tree_node, [], k).first
end


def reverse_order_traversal(node = @root, arr = [], k)
  reverse_order_traversal(node.right, arr, k) if node.right && arr.length != k
  arr.unshift(node) if arr.length != k
  reverse_order_traversal(node.left, arr, k) if node.left && arr.length != k

  arr
end
