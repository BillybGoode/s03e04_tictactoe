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


# Show the board (A,B,C lines and 1,2,3 columns) (3x3 array of hash, keys = A,B,C)
puts my_game.board

# Loops for 9 rounds max
#   lets first player choose where to play (gets.chomp)
#   check if valid input, if not loop back
#   if yes show updated board
#   assess if winner ? yes = break
# end

# win message if winner
# tie message if no winner
# play again ?

binding.pry