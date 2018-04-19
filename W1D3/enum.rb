require 'byebug'
def range_iter(start, ending)
  i = start
  result = []
  while i < ending
    result << i
    i += 1
  end
  result
end

def range_rec(start, ending)
  return [] if start >= ending
  [start] + range_rec(start + 1, ending)
end

def sum_iter(nums)
  result = 0
  nums.each {|num| result += num}
  result
end

def sum_rec(nums)
  return 0 if nums.empty?
  nums.first + sum_rec(nums.drop(1))
end

def exp(base, pow)
  return 1 if pow == 0
  base * exp(base, pow - 1)
end

def exp_half(base, pow)
  return 1 if pow == 0
  half = exp_half(base, pow/2)

  if pow.even?
    half * half
  else
    base * half * half
  end
end

class Array
  def deep_dup
    return self if self.length == 1
    new_arr = []
    self.each {|el| el.is_a?(Array) ? new_arr << el.deep_dup : new_arr << el}
    new_arr
  end
end

def fib(n)
  return nil if n <= 0
  case n
  when 1
    [0]
  when 2
    [0, 1]
  else
    prev_fib = fib(n-1)
    prev_fib << (prev_fib[-2] + prev_fib[-1])
  end
end

def bsearch(array, target)
  return nil if array.empty?

  mid = array.length / 2

  case array[mid] <=> target
  when 0
    return mid
  when -1
    high_search = bsearch(array[mid+1..-1], target)
    return nil if high_search.nil?
    return mid + 1 + high_search
  when 1
    return bsearch(array[0...mid], target)
  end
end


class Array
  def merge_sort(&prc)
    prc ||= Proc.new {|a,b| a <=> b}
    return self if length <= 1

    mid = length / 2
    left = self[0...mid].merge_sort(&prc)
    right = self[mid..-1].merge_sort(&prc)

    self.class.merge(left, right, &prc)
  end

  def self.merge(arr1, arr2, &prc)
    result = []
    until arr1.empty? || arr2.empty?
      arr1[0] < arr2[0] ? result << arr1.shift : result << arr2.shift
    end
    result + arr1 + arr2
  end
end

def subsets(n)
  return [[]] if n == 0
  result = subsets(n-1)
  result + result.map { |subarr| subarr += [n] }
end

def permutations
  
end
