require_relative('cell')
class Board
  DIRECTIONS = [
    [-1,-1], [-1,0], [-1,1],
    [0, -1], [0, 1],
    [1, -1], [-1, 0], [1, 1]
  ]
  
  attr_accessor :grid
  
  def initialize(width = 36, height = 36)
    self.grid = Array.new(width) { Array.new(height) }
  end
  
  def [] (pos)
    self.grid[pos.first][pos.last]
  end
  
  def []= (pos, value)
    self.grid[pos.first][pos.last] = value
  end
  
  def create_cells
    self.grid.times do |row|
      self.grid[0].times do |col|
        self[row][col] = Cell.new
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
      neighbors << self[pos] if self.on_board?(new_pos)
    end
    neighbors
  end
  
  def render
   self.grid.each do |row|
     print "\n"
     row.each do |cell|
       cell.state == :dead ? print(' ') : print('O')
     end
   end
  end
  
end