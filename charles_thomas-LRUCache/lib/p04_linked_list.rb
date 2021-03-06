require 'byebug'

class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous node to next node
    # and removes self from list.

    self.prev.next = self.next
    self.next.prev = self.prev

    self.next = nil
    self.prev = nil
    nil
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    each do |node|
      return node.val if node.key == key
    end
    return nil
  end

  def include?(key)
    each {|node| return true if node.key == key}
    return false
  end

  def append(key, val)
    node = Node.new(key, val)
    node.next = @tail
    node.prev = @tail.prev
    @tail.prev.next = node
    @tail.prev = node
  end

  def update(key, val)
    each { |node| node.val = val if node.key == key }
  end

  def remove(key)
    each {|node| return node.remove if node.key == key}
  end

  def each
    node = first
    until node == @tail
      yield(node)
      node = node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  end

  def inspect
    inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  end
end
