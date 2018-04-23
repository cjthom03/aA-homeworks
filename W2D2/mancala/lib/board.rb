class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) {Array.new}
    @player1 = name1
    @player2 = name2

    place_stones
  end

  def place_stones
    @cups = @cups.map.with_index do |cup, i|
      [6,13].include?(i) ? (cup) : ([:stone] * 4)
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(0,5) || start_pos.between?(7,12)
    raise "Invalid starting cup" if @cups[start_pos]
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos].dup
    @cups[start_pos] = []

    next_cup = start_pos + 1

    until stones.empty?
      unless (next_cup == 6 && current_player_name == @player2) ||
      (next_cup == 13 && current_player_name == @player1)
        @cups[next_cup] << stones.pop
      end
      next_cup = (next_cup + 1) % 14
    end

    ending_cup_idx = (next_cup - 1) % 14

    render
    next_turn(ending_cup_idx)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all? {|cup| cup.empty?} || @cups[7..12].all? {|cup| cup.empty?}
  end

  def winner
    player1_score = @cups[6].count
    player2_score = @cups[13].count

    case player1_score <=> player2_score
    when 0
      :draw
    when 1
      @player1
    when -1
      @player2
    end
  end
end
