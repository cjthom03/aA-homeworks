require 'byebug'

class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length <= 1
    pivot = array.first
    left = array[1..-1].select { |el| el <= pivot}
    right = array[1..-1].select { |el| el > pivot}

    return self.class.sort1(left) + [pivot] + self.class.sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    return array if length <= 1

    pivot_idx = self.partition(array, start, length, &prc)

    left_length = pivot_idx - start
    left = self.sort2!(array, start, left_length, &prc)

    right_length = length - pivot_idx - 1
    right = self.sort2!(array, pivot_idx + 1, right_length, &prc)

  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new {|num1, num2| num1 <=> num2 }
    pivot = array[start]
    partition = start + 1

    (length - 1).times do |i|
      idx = start + i + 1
      compare = prc.call(pivot, array[idx])
      if compare >= 0
        array[idx], array[partition] = array[partition], array[idx]
        partition += 1
      end
    end

    array[start], array[partition - 1] = array[partition - 1], array[start]

    return partition - 1
  end
end
