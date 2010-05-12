require 'board'

class Game
  # 012
  # 345
  # 678

  def initialize(players)
    @players = players
    @current_player = @players.first
  end
  
  def play(reporter)
    board = Board.new(reporter)
    until board.done?
      reporter.state(board.state)
      move = @current_player.move(board)
      reporter.move(move, @current_player.symbol)
      board.move!(move, @current_player.symbol)
      switch_players!
    end
  end
  
  private
  
  def player
    @current_player
  end
  
  def switch_players!
    @current_player = @players.other(@current_player)
  end
end