require_relative "static_array"
require 'byebug'

class DynamicArray
  attr_reader :length

  def initialize
    @length = 0
    @capacity = 8
    @store = StaticArray.new(@capacity)
  end

  # O(1)
  def [](index)
    check_index(index)
    @store[index]
  end

  # O(1)
  def []=(index, value)
    check_index(index)
    @store[index] = value
  end

  # O(1)
  def pop
    check_index(0)
    popped = @store[@length - 1]
    @store[@length - 1] = nil
    @length -= 1
    popped
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if @length == @capacity

    @store[@length] = val
    @length += 1
  end

  # O(n): has to shift over all the elements.
  def shift
    check_index(0)
    shifted = @store[0]
    (@length - 1).times {|i| @store[i] = @store[i + 1]}
    pop
    shifted
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    resize! if @length == @capacity

    new_store = StaticArray.new(@capacity)

    new_store[0] = val
    @length.times {|i| new_store[i+1] = @store[i]}
    @store = new_store
    @length += 1
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" if index > @length - 1
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
      @capacity *= 2
      new_store = StaticArray.new(@capacity)
      @length.times {|i| new_store[i] = @store[i]}
      @store = new_store
  end
end
