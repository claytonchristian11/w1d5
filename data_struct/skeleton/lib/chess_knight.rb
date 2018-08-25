require "./00_tree_node.rb"
require "byebug"

class KnightPathFinder
  
  attr_accessor :root_node, :visited_positions, :array
  
  def self.valid_moves(pos)
    possible_moves = 
    [
    [pos[0] + 1, pos[1] + 2],
    [pos[0] + 1, pos[1] - 2],
    [pos[0] - 1, pos[1] + 2],
    [pos[0] - 1, pos[1] - 2],
    [pos[0] + 2, pos[1] + 1],
    [pos[0] + 2, pos[1] - 1],
    [pos[0] - 2, pos[1] + 1],
    [pos[0] - 2, pos[1] - 1]
    ]
    possible_moves.reject do |subarray|
      move_0, move_1 = subarray
      move_0 < 0 || move_0 > 7 || move_1 < 0 || move_1 > 7
    end
    
    
  end
  
  def initialize(start_pos, end_pos)
    @visited_positions = [start_pos]
    @root_node = start_pos
    build_move_tree()
  end
  
  def build_move_tree()
    @array = [PolyTreeNode.new(@root_node)]
    until @array.empty?
      val1 = @array[0].value
      # return @array[0] if val1 == end_pos
      new_move_position(@array[0].value).each do |move|
        @array += [PolyTreeNode.new(move)]
        @array[0].add_child(@array[-1])
      end
      @array.shift
    end

    @array
  end
  
  
  def find_path
    
  end
  
  def new_move_position(pos)
    moves = KnightPathFinder.valid_moves(pos)
    moves.reject! {|move| visited_positions.include?(move)}
    @visited_positions += moves
    moves
  end
  
  def find_path(end_pos)
    first_node = self.root_node
    
    current_node = 
    until  == end_pos
      val1 = array[0].value
      return array[0] if val1 == target_value
      array += array[0].children
      array.shift
    end
  end
  
  def trace_path_back
    
  end
  
end