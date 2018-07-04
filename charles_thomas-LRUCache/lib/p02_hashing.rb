class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    result = 0
    self.each_with_index do |el, i|
      result += el.hash * i.hash
    end
    result
  end
end

class String
  def hash
    result = 0
    chars.each_with_index do |char, i|
      result += (char.ord * (i + 1)).hash
    end
    result.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    sort.hash
  end
end
