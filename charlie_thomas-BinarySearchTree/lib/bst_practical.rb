require_relative 'binary_search_tree'

def kth_largest(tree_node, k)
  tree_queue = [tree_node]
  tree_queue.each do |node|
    break if tree_queue.length == k
    tree_queue << node.left if node.left
    tree_queue << node.right if node.right
  end

  tree_queue[k]
end
