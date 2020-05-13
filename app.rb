require "pry" #use with binding.pry
require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'player'
require 'game'

puts "-------------------------------------------------"
puts "|Bienvenue sur 'LES MORT-PIONS DE LA MORT' !    |"
puts "|Le but du jeu est ... de gagner !!!            |"
puts "-------------------------------------------------"
puts ""

my_game = Game.new()

my_game.randomize_first_player # Randomize first player
my_game.give_symbol # give symbols "X" and "O" to play with

my_game.board_display # Show the board (A,B,C lines and 1,2,3 columns) (3x3 array of hash, keys = A,B,C)

while !my_game.winner || !my_game.board_is_full
#   lets first player choose where to play (gets.chomp)
    ok_move = false
    while !ok_move # checks validity of the move, if not loop back
        player_move = my_game.choose_move 
        ok_move = my_game.available_move(player_move) 
    end
    my_game.board_update(player_move, my_game.current_player) #updates the board with the move


#   if yes show updated board
#   assess if winner ? yes = break
  my_game.players.reverse! #next player (one line method = nono)
end

# win message if winner
# tie message if no winner
# play again ?

binding.pry