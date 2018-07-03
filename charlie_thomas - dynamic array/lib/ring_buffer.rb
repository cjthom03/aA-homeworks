require_relative "static_array"
require 'byebug'

class RingBuffer
  attr_reader :length

  def initialize
    @length = 0
    @start_idx = 0
    @capacity = 8
    @store = StaticArray.new(@capacity)
  end

  # O(1)
  def [](index)
    check_index(index)
    @store[(@start_idx + index) % @capacity]
  end

  # O(1)
  def []=(index, val)
    check_index(index)
    @store[(@start_idx + index) % @capacity] = val
  end

  # O(1)
  def pop
    check_index(0)
    pop_idx = ((@start_idx + @length) % @capacity) - 1
    popped = @store[pop_idx]
    @store[pop_idx] = nil
    @length -= 1
    popped
  end

  # O(1) ammortized
  def push(val)
    resize! if @length == @capacity

    push_idx = (@start_idx + @length) % @capacity

    @store[push_idx] = val
    @length += 1
  end

  # O(1)
  def shift
    check_index(0)
    shifted = @store[@start_idx]
    @store[@start_idx] = nil
    @start_idx = (@start_idx + 1) % capacity
    @length -= 1
    shifted
  end

  # O(1) ammortized
  def unshift(val)
    resize! if @length == @capacity


    @start_idx = (@start_idx - 1) % @capacity
    @store[@start_idx] = val
    @length += 1

  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" if index > @length - 1
  end

  def resize!
    @capacity *= 2
    new_store = StaticArray.new(@capacity)
    @length.times do |i|
      idx = (@start_idx + i) % @length
      new_store[i] = @store[idx]
    end

    @store = new_store
    @start_idx = 0
  end
end
