# Empty board sketch to implement
#   (1) (2) (3)
#(A)   |   |   
#   ---|---|---
#(B)   |   |   
#   ---|---|---
#(C)   |   |   

# Back-en board sketch to implement
#   (1) (2) (3)
#(A) 1 | 2 | 3 
#   ---|---|---
#(B) 4 | 5 | 6 
#   ---|---|---
#(C) 7 | 8 | 9 

# then at update, replace [1..9] by " " or "X" or "O"

class Board
    attr_accessor :cells
    def initialize
        @cells = []
    end

    def board_hash_formatting(board_hash)
        temp_board = board_hash.flatten(2)
        temp_board.delete("A")
        temp_board.delete("B")
        temp_board.delete("C")
        temp_board.each.with_index do |cell, index|
            temp_board[index] = " " if cell == nil
        end
        temp_board
    end

    def display(board_hash)
        board_array = board_hash_formatting(board_hash)
        
        print "Voici le terrain de jeu :
   (1) (2) (3)
(A) #{board_array[0]} | #{board_array[1]} | #{board_array[2]} 
   ---|---|---
(B) #{board_array[3]} | #{board_array[4]} | #{board_array[5]} 
   ---|---|---
(C) #{board_array[6]} | #{board_array[7]} | #{board_array[8]}

"
    end
end