#require '00_tree_node'
require 'byebug'

class KnightPathFinder
DELTAS = [
  [2,   1],
  [2,  -1],
  [-2,  1],
  [-2, -1],
  [1,   2],
  [1,  -2],
  [-1,  2],
  [-1, -2]
]
  def initialize(pos)
    @starting_pos = pos
    @visited_positions = [@starting_pos]

    # @path = build_move_tree
  end

  def find_pos

  end

  def build_move_tree

  end

  def new_move_positions(pos)
    # @visited_postions.each do |visited|
     new_moves = KnightPathFinder.valid_moves(pos)
     result = []
     new_moves.each do |position|
      result << position if !(@visited_positions.include?(position))
    end
    debugger
    @visited_positions.concat(result)
  end

  def self.valid_moves(pos)
    @potential_moves = []
    DELTAS.each do |move|
      if ((move[0]+ pos[0]).between?(0,7)) && (move[1]+ pos[1]).between?(0,7)
        @potential_moves << [move[0]+ pos[0], move[1]+ pos[1]]
      end
    end
    @potential_moves
  end


end
