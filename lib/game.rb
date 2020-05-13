require 'player'

class Game < Player
  attr_accessor :board, :players, :round

  def initialize
    @board = {"A" => [nil, nil, nil], "B" => [nil, nil, nil], "C" => [nil, nil, nil]}
    @players = [] # current player is the one at index 0 (change turn with .reverse!)
    for i in 0..1
        puts "Veuillez entrer le pseudo du joueur #{i+1} !!!"
        print " >> "
        @players << Player.new(gets.chomp)
        puts "\n"
    end
  end

  def ask_name
    puts "Quel est ton nom joueur(e) ?"
    print "  >> "
    @players << Player.new(gets.chomp).player_name
  end

  def randomize_first_player
    if rand(0..1) == 0
        @players.reverse!
    end
    puts "Petit tirage à pile où face... \n...*ping* *tap*...\n"
    puts "Ok c'est #{@players[0].player_name} qui va commencer à jouer"
    puts "\n"
  end

  def give_symbol
    @players[0].symbol = "X"
    @players[1].symbol = "O"
    puts "Super, c'est parti !!!\n#{@players[0].player_name} tu utiliseras les CROIX \"X\" et\n#{@players[1].player_name} tu utiliseras les RONDS \"O\""
    puts "\n"
  end

  def current_player
    @players[0]
  end

  def board_display
    puts "Voici le terrain de jeu !"
    puts "\n"
    puts @board
    puts "\n"
  end

  def available_move(move)
    result = false
    if move == 'A1' || move == 'A2' || move == 'A3' || move == 'B1' || move == 'B2' || move == 'B3' || move == 'C1' || move == 'C2' || move == 'C3'
      line_col = move.split('')
      if @board[line_col[0]][line_col[1].to_i-1] != nil
        puts "Ah non cette case est déjà prise désolé, essaie encore mon ami(e) !"
        puts ""
      else 
        result = true
      end
    else
        puts "Il faut entrer une valeur du tableau ! (ex: A1, B3, C2, ...)"
    end
    return result
  end

  def board_update(move, player)
    line = move.split('')[0]
    column = move.split('')[1].to_i - 1
    @board[line][column] = player.symbol
    self.board_display
  end

  def winner(player)
    if player.is_the_winner
      puts "Congratulations #{player.player_name} you win the game !"
      puts ""
      return true
    end
  end

  def is_board_full
    board_is_full = true
    @board.flatten(2).each do |cell|
        if cell == nil
          board_is_full = false
          break
        end
    end
    puts "Oh my, this is a tie game !!" if board_is_full
    return board_is_full
  end

  def launch_new_game
    puts "Bon c'était fun, vous voulez continuer à jouer ? (y/n)"
    puts "\n"
    continue = gets.chomp
    if continue.downcase == "y"
      @board = {"A" => [nil, nil, nil], "B" => [nil, nil, nil], "C" => [nil, nil, nil]}
      @players[0].plays = []
      @players[1].plays = []
      @players[0].symbol = ""
      @players[1].symbol = ""
      return true
    else
      puts "Ok à bientôt !"
      return false
    end
  end
end