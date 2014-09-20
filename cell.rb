class Cell
  
  attr_accessor :state, :board, :next_state, :pos
  
  def initialize(board, pos, state = :dead)
    self.pos = pos
    self.state = state
    self.board = board
  end
  
  def update_state
    self.state = self.next_state
  end
  
  def neighbors
    @board.neighbors(self.pos)
  end
  
  def get_next_state
    neighbors = self.neighbors
    alive = 0
    self.neighbors.each do |cell|
      alive += 1 if cell.state == :alive
    end
    if self.state == :alive
      self.next_state = :dead if alive < 2
      self.next_state = :alive if alive == 2 || alive == 3
      self.next_state = :dead if alive > 3
    end
    self.next_state = :alive if self.state == :dead && alive == 3
  end
  
end