require 'byebug'

class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = []
    @prc = prc || Proc.new { |el1, el2| (el1 <=> el2) }
  end

  def count
    @store.length
  end

  def extract
    @store[0], @store[-1] = @store[-1], @store[0]
    extracted = @store.pop
    @store = self.class.heapify_down(@store, 0, &@prc)
    return extracted
  end

  def peek
    @store[0]
  end

  def push(val)
    @store.push(val)
    self.class.heapify_up(@store, count - 1, &@prc)
  end

  public
  def self.child_indices(len, parent_index)
    children = []
    2.times do |i|
      child = (parent_index * 2) + (i + 1)
      children << child if child < len
    end
    children
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new { |el1, el2| (el1 <=> el2) }
    children = BinaryMinHeap.child_indices(len, parent_idx)
    valid_child1 = children[0] == nil || prc.call(array[parent_idx], array[children[0]]) != 1
    valid_child2 = children[1] == nil || prc.call(array[parent_idx], array[children[1]]) != 1

    return array if children.empty? || (valid_child1 && valid_child2)

    switch = 0

    if valid_child1
      switch = 1
    elsif !valid_child1 && !valid_child2
      compare = prc.call(array[children[0]], array[children[1]])
      switch = 1 if compare == 1
    end

    array[parent_idx], array[children[switch]] = array[children[switch]], array[parent_idx]
    parent_idx = children[switch]
    BinaryMinHeap.heapify_down(array, parent_idx, len, &prc)
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    return array if child_idx == 0
    prc ||= Proc.new { |el1, el2| (el1 <=> el2) }

    parent_idx = BinaryMinHeap.parent_index(child_idx)
    valid_parent = prc.call(array[parent_idx], array[child_idx]) < 1

    return array if valid_parent

    array[parent_idx], array[child_idx] = array[child_idx], array[parent_idx]

    BinaryMinHeap.heapify_up(array, parent_idx, len, &prc)
  end
end
