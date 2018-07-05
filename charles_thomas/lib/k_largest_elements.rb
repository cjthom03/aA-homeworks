require_relative 'heap'

def k_largest_elements(array, k)
  return nil if k > array.length

  prc = Proc.new { |el1, el2| -1 * (el1 <=> el2) }

  (1...array.length).each do |idx|
    BinaryMinHeap.heapify_up(array, idx, &prc)
  end

  (array.length - 1).downto(array.length - k) do |len|
    array[0], array[len] = array[len], array[0]
    BinaryMinHeap.heapify_down(array, 0, len, &prc)
  end

  array[-k..-1]
end
