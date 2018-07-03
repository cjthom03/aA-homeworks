# Implement a queue with #enqueue and #dequeue, as well as a #max API,
# a method which returns the maximum element still in the queue. This
# is trivial to do by spending O(n) time upon dequeuing.
# Can you do it in O(1) amortized? Maybe use an auxiliary storage structure?

# Use your RingBuffer to achieve optimal shifts! Write any additional
# methods you need.

require_relative 'ring_buffer'

class QueueWithMax
  attr_accessor :store

  def initialize
    @store = RingBuffer.new
    @max_arr = RingBuffer.new
  end

  def enqueue(val)
    set_max(val)
    @store.push(val)
  end

  def dequeue
    dequeued = @store.shift
    @max_arr.shift if dequeued == max
    dequeued
  end

  def max
    @max_arr[0]
  end

  def length
    @store.length
  end

  private

  def set_max(val)
    while @max_arr.length > 0 && val > @max_arr[@max_arr.length - 1]
      @max_arr.pop
    end

    @max_arr.push(val)
  end

end
