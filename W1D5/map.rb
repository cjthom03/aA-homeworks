class Map
  def initialize
    @map =[]
  end

  def assign(key, value)
    if has_key?(key)
      index = get_index(key)
      @map[index][-1] = value
    else
      @map << [key, value]
    end
  end

  def lookup(key)
    index = get_index(key)
    @map[index].last if index
  end

  def remove(key)
    index = get_index(key)
    @map = @map[0...index] + @map[index+1..-1] if index
  end

  def show
    @map.each do |(key, value)|
      puts "-------------------------------------"
      puts "Key:    #{key.inspect}"
      puts "Value:  #{value.inspect}"
      puts "-------------------------------------"
    end
  end

  private

  def has_key?(target_key)
    @map.any? {|(key, _)| key == target_key }
  end

  def get_index(key)
    index = nil
    @map.each_with_index do |(el_key,_), i|
      if key == el_key
        index = i
        break
      end
    end
    index
  end

end
