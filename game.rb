require_relative('board')
class Game
  attr_reader :board
  def initialize
    @board = Board.new
  end
  
  def play(step = 200)
    step.times do |step|
      sleep(0.4)
      system("clear")
      board.render
      board.update_cell_states
      board.time_pass
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.board[[3,2]].state = :alive
  game.board[[2,1]].state = :alive
  game.board[[2,2]].state = :alive
  game.board[[1,1]].state = :alive
  game.board[[4,4]].state = :alive
  game.board[[2,4]].state = :alive
  game.board[[4,3]].state = :alive
  game.board[[3,0]].state = :alive
  game.play

end