class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.push(el)
  end

  def dequeue
    puts "Queue is already empty" if @queue.empty?
    @queue.shift
  end

  def show
    puts 'Queue is empty' if @queue.empty?
    @queue.each_with_index do |el, i|
      puts "Queue position #{i + 1}:  #{el}"
    end
  end
end
