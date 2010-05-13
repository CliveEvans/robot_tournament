# class Tournament
#   def initialize(name, rounds, &play)
#     @name = name
#     @play = play
#   end
#   
#   def play
#     players = PlayerStore.new.players
#     winners = []
#     
#     players.each do |player1|
#       players.each do |player2|
#         next if player1 == player2
#         winner = @play.call(player1, player2)
#         winners << winner
#       end
#     end
#     
#     @wins = {}
#     players.each do |player|
#       @wins[player] = winners.select{ |p| p == player }.length
#     end
# 
#   end
#   
#   def winner
#     best_win = 0
#     winner = nil
#     @wins.each do |player, wins|
#       if wins > best_win
#         winner = player
#       end
#     end
#     winner
#   end
# end
# 
When /^I create a new Tournament "([^\"]*)" with the following attributes:$/ do |name, table|
  attributes = table.rows_hash
  Tournament.new(attributes).start
end

# Given /^a tournament 'rock-paper-scissors' with (\d+) round$/ do |rounds|
#   @tournament = Tournament.new('rock-paper-scissors', rounds.to_i) do |player1, player2|
#     player1_move = player1.move.strip
#     player2_move = player2.move.strip
#     
#     if player1_move == 'rock' && player2_move == 'paper'
#       player2
#     elsif player1_move == 'paper' && player2_move == 'rock'
#       player1
#     else
#       raise("Dunno who won! (player1: '#{player1_move}', player2: '#{player2_move}')")
#     end
#   end
# end
# 
# When /^the tournament is played$/ do
#   @tournament.play
# end
# 
# Then /^the player 'always\-paper' should be the winner$/ do
#   @tournament.winner.name.should == 'always-paper'
# end