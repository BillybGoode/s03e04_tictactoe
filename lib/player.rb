class Player
  attr_accessor :player_name, :plays, :symbol

  def initialize(name)
    @player_name = name
    @plays = []
    @symbol = ""
  end    

  def choose_move
    puts "Alors #{@players[0].player_name} quel move veux-tu faire ? Tu joues les #{@players[0].symbol} Choisis bien ! (ex: A1, B3, C2, ...)"
    print " >> "
    move = gets.chomp
    @players[0].plays << move
    puts ""
    return move
  end

  def is_the_winner
    if @plays.include?('A1') && @plays.include?('B2') && @plays.include?('C3')
      return true
    elsif @plays.include?('A3') && @plays.include?('B2') && @plays.include?('C1')
      return true
    else
      flat_move = []
      @plays.each do |move| #separate letter and number of move into new array
        flat_move << move[0]
        flat_move << move[1]
      end
      cl_list = ['A', 'B', 'C', '1', '2', '3'] # initialize columns and lines "string"
      cl_list.each do |col_or_line|
        if flat_move.count(col_or_line) == 3
          return true
        end
      end
    end
    return false
  end

end