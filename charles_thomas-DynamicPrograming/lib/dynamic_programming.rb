require 'byebug'

class DynamicProgramming

  def initialize
    @blair_cache = {1 => 1, 2 => 2}
    @frog_cache = {
      1 => [[1]],
      2 => [[1,1], [2]],
      3 => [[1,2], [1,1,1], [2,1], [3]]
    }
    @super_frog_cache = { 0 => [[]]}
  end

  def blair_nums(n)
    return @blair_cache[n] if @blair_cache[n]
    kth_odd_num = ((n-1) * 2 ) - 1
    ans = blair_nums(n-1) + blair_nums(n-2) + kth_odd_num
    @blair_cache[n] = ans
  end

  def blair_nums_bottoms_up(n)
    cache = {1 => 1, 2 => 2}
    return nil if n < 1
    return cache[n] if n < 3

    (3..n).each do |i|
      kth_odd_num = ((i-1) * 2 ) - 1
      cache[i] = cache[i-1] + cache[i-2] + kth_odd_num
    end

    return cache[n]
  end

  def frog_hops_bottom_up(n)
    cache = frog_cache_builder(n)
    cache[n]
  end

  def frog_cache_builder(n)
    return {} if n < 1
    cache = {
      1 => [[1]],
      2 => [[1,1], [2]],
      3 => [[1,2], [1,1,1], [2,1], [3]]
    }

    (4..n).each do |i|
      plus3 = cache[i-3].map { |steps| steps + [3] }
      plus2 = cache[i-2].map { |steps| steps + [2] }
      plus1 = cache[i-1].map { |steps| steps + [1] }
      cache[i] = plus3 + plus2 + plus1
    end

    cache
  end

  def frog_hops_top_down(n)
    frog_hops_top_down_helper(n)
    @frog_cache[n]
  end

  def frog_hops_top_down_helper(n)
    return @frog_cache[n] if @frog_cache[n]

    plus3 = frog_hops_top_down_helper(n-3).map { |steps| steps + [3] }
    plus2 = frog_hops_top_down_helper(n-2).map { |steps| steps + [2] }
    plus1 = frog_hops_top_down_helper(n-1).map { |steps| steps + [1] }

    ans = plus3 + plus2 + plus1
    @frog_cache[n] = ans
  end

  def super_frog_hops(n, k)
    @super_frog_cache = { 0 => [[]]}
    super_frog_helper(n, k)
    @super_frog_cache[n]
  end

  def super_frog_helper(n, k)
    return @super_frog_cache[n] if @super_frog_cache[n]

    unless @super_frog_cache[k]
      (1..k).each do |max_step|
        solutions = []
        max_step.downto(1).each do |step|
          solutions += @super_frog_cache[max_step - step].map {|el| el + [step]}
        end

        @super_frog_cache[max_step] = solutions
        return @super_frog_cache[n] if @super_frog_cache[n]
      end
    end

    ans = []
    k.downto(1).each do |level|
      ans += super_frog_helper(n-level, k).map {|steps| steps + [level]}
    end

    @super_frog_cache[n] = ans
  end


  def knapsack(weights, values, capacity)
    return 0 if capacity < weights.min
    table = knapsack_table(weights, values, capacity)
    table.last.last
  end

 # Helper method for bottom-up implementation

 # create an array (table) of n arrays, where n = capacity + 1
  def knapsack_table(weights, values, capacity)
   # iterate over the weights
   # nested - iterate over the table array
     # For each capacity_idx < weight, push into the current capacity array..
         # either a 0 or the last value in the current capacity array (which ever is larger)
     # For capacity_idx >= weight
         # compare capacity[idx].last to (capacity[idx-weight].second_to_last + value of current weight)
         # Which ever is larger, push into capacity[idx]

    table = Array.new(capacity + 1) { Array.new }

    weights.each_with_index do |weight, wv_id|
      table.each_with_index do |local_solutions, current_cap|
        new_value = 0
        if current_cap < weight
          new_value = local_solutions[-1] || new_value
          local_solutions << new_value
        else
          if wv_id == 0
            new_value = values[wv_id]
            local_solutions << new_value
          else
            with_weight = table[current_cap - weight][-2] + values[wv_id]
            without_weight = local_solutions.last
            new_value =[with_weight, without_weight].max
            local_solutions << new_value
          end
        end
      end
    end

    table
 end

  def maze_solver(maze, start_pos, end_pos)
  end
end
