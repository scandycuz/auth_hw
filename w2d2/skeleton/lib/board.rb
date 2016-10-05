require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { Array.new }
    @name1 = name1
    @name2 = name2
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    (0..5).each do |idx|
      cups[idx] = [:stone, :stone, :stone, :stone]
    end
    (7..12).each do |idx|
      cups[idx] = [:stone, :stone, :stone, :stone]
    end
  end

  def valid_move?(start_pos)
    if start_pos < 0 || start_pos > 12 || cups[start_pos].empty?
      raise "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)
    temp_cup = cups[start_pos]
    cups[start_pos] = []

    cup_idx = start_pos
    until temp_cup.empty?
      # debugger
      cup_idx += 1
      cup_idx = 0 if cup_idx > 13

      if cup_idx == 6
        cups[cup_idx] << temp_cup.shift if current_player_name == @name1
      elsif cup_idx == 13
        cups[cup_idx] << temp_cup.shift if current_player_name == @name2
      else
        cups[cup_idx] << temp_cup.shift
      end
    end

    render
    next_turn(cup_idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif cups[ending_cup_idx].length == 1
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

  def cups_empty?
    return true if cups[0..5].all?(&:empty?) || cups[7..12].all?(&:empty?)
    false
  end

  def winner
    return :draw if cups[6].count == cups[13].count
    cups[6].count > cups[13].count ? @name1 : @name2
  end
end

# board = Board.new("Erica", "James")
#
# board.make_move(0, "James")
# board.make_move(5, "Erica")
# board.make_move(12, "Erica")
# board.make_move(1, "Erica")
# board.make_move(1, "Erica")
# puts "final move"
# board.make_move(10, "James")
