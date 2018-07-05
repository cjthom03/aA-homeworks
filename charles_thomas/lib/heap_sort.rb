require_relative "heap"
require 'byebug'

class Array
  def heap_sort!
    return self if length < 2

    prc = Proc.new { |el1, el2| -1 * (el1 <=> el2) }

    (1...self.length).each do |idx|
      BinaryMinHeap.heapify_up(self, idx, &prc)
    end

    (self.length - 1).downto(1) do |len|
      # debugger
      self[0], self[len] = self[len], self[0]
      BinaryMinHeap.heapify_down(self, 0, len, &prc)
    end


    self
  end
end
