require "pry" #use with binding.pry
require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'player'
require 'game'

class Application
  def self.perform
    puts "-------------------------------------------------"
    puts "|Bienvenue sur 'LES MORT-PIONS DE LA MORT' !    |"
    puts "|Le but du jeu est ... de gagner !!!            |"
    puts "-------------------------------------------------"
    puts ""

    my_game = Game.new()

    begin # putting while here allows to keep player names
      my_game.randomize_first_player # Randomize first player
      my_game.give_symbol # give symbols "X" and "O" to play with
      my_game.board_display # Shows the board (A,B,C lines and 1,2,3 columns) (3x3 array of hash, keys = A,B,C)

      while true
        #   lets first player choose where to play (gets.chomp)
        ok_move = false
        while !ok_move # checks validity of the move, if not loop back
          player_move = my_game.choose_move 
          ok_move = my_game.available_move(player_move) 
        end
        my_game.board_update(player_move, my_game.current_player) #updates the board with the move

        break if my_game.winner(my_game.current_player)
        break if my_game.is_board_full

        my_game.players.reverse! #next player (one line method = nono need)
      end 
    end until !my_game.launch_new_game
  end
end

Application.perform