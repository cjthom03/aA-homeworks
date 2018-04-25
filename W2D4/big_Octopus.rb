
# ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(array)
  #O(n^2)
  biggest_fish_index = 0

  array.each_with_index do |fish1, f1|
    array.each_with_index do |fish2, f2|
      bigger_fish = fish1.length > fish2.length ? f1 : f2
      biggest_fish_index = bigger_fish if bigger_fish > biggest_fish_index
    end
  end

  array[biggest_fish_index]
end

def dominant_octopus(array)
  #O(n log(n))
  merge_fish(array).last
end

def merge_fish(array)
  return array if array.length <= 1

  mid = array.length / 2
  left = merge_fish(array.take(mid))
  right = merge_fish(array.drop(mid))

  support_dominant_octopus(left, right)
end


def support_dominant_octopus(left_fish, right_fish)
  result_fish = []
  until left_fish.empty? || right_fish.empty?
    if left_fish[0].length < right_fish[0].length
      result_fish << left_fish.shift
    else
      result_fish << right_fish.shift
    end
  end
  result_fish + left_fish + right_fish
end

def clever_octopus(array)
  #O(n)
  longest_fish = array[0]
  array.each do |fish|
    longest_fish = fish if fish.length > longest_fish.length
  end
  longest_fish
end

# tiles = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
# tiles = {"up" => :tenticle1, "right-up" => :tenticle2, "right"=> :tenticle3, "right-down"=> :tenticle4, "down"=> :tenticle5, "left-down"=> :tenticle6, "left"=> :tenticle7,  "left-up"=> :tenticle8  }

def slow_dance(direction, tiles)
  tiles.each_with_index { |tile, i| return i if tile == direction}
end

def fast_dance(direction, tiles)
  tiles[direction]
end
