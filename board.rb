require_relative('cell')
class Board
  DIRECTIONS = [
    [-1,-1], [-1,0], [-1,1],
    [0, -1], [0, 1],
    [1, -1], [-1, 0], [1, 1]
  ]
  
  attr_accessor :grid, :width, :height
  
  def initialize(width = 12, height = 12)
    self.grid = Array.new(width) { Array.new(height) }
    self.width = width
    self.height = height
    self.create_cells
  end
  
  def [](pos)
    self.grid[pos.first][pos.last]
  end
  
  def []=(pos, value)
    self.grid[pos.first][pos.last] = value
  end
  
  def create_cells
    self.width.times do |row|
      self.height.times do |col|
        self[[row,col]] = Cell.new(self, [row,col])
      end
    end
  end
  
  def on_board?(pos)
    (0...width).include?(pos.first) && (0...height).include?(pos.last)
  end
  
  def neighbors(pos)
    neighbors = []
    DIRECTIONS.each do |dir|
      new_pos = [pos.first+dir.first, pos.last+dir.last]
      neighbors << self[new_pos] if self.on_board?(new_pos)
    end
    neighbors
  end
  
  def update_cell_states
    self.width.times do |row|
      self.height.times do |col|
        self[[row,col]].get_next_state
      end
    end
  end
  
  def time_pass
    self.width.times do |row|
      self.height.times do |col|
        self[[row,col]].update_state
      end
    end
  end
  
  def render
   self.grid.each do |row|
     print "\n"
     row.each do |cell|
       cell.state == :dead ? print('X') : print('0')
     end
   end
  end
  
  
end


