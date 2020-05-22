class Player
  attr_accessor :player_name, :plays, :symbol

  def initialize(name)
    @player_name = name
    @plays = []
    @symbol = ""
  end    

  def choose_move
    puts "Alors #{@players[0].player_name} quel move veux-tu faire ?\nPetit rappel: tu joues les #{@players[0].symbol}\nChoisis bien !\n(ex: A1, B3, C2, ...)\n\n"
    print " >> "
    move = gets.chomp
    @players[0].plays << move
    puts ""
    return move
  end

  def is_the_winner
    # First two conditions checks diagonals
    if @plays.include?('A1') && @plays.include?('B2') && @plays.include?('C3')
      return true
    elsif @plays.include?('A3') && @plays.include?('B2') && @plays.include?('C1')
      return true
    # This conditions checks if any three of a kind (letter or number) exists
    else
      flattened_move = []
      @plays.each do |move| #separate letter and number of move into new array
        flattened_move << move[0]
        flattened_move << move[1]
      end
      columns_and_lines_names = ['A', 'B', 'C', '1', '2', '3'] # initialize columns and lines "string"
      columns_and_lines_names.each do |column_or_line|
        if flattened_move.count(column_or_line) == 3
          return true
        end
      end
    end
    return false
  end

end