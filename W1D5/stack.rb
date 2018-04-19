class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack.push(el)
  end

  def remove
    @stack.pop
  end

  def show
    puts ''
    (@stack.length - 1).downto(0).each do |i|
      puts "Stack Level #{i}:  #{@stack[i]}"
    end
    puts ''
  end
end
