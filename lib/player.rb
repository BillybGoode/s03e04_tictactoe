class Player
  attr_accessor :player_name, :plays, :symbol

  def initialize(name)
    @player_name = name
    @plays = []
    @symbol = ""
  end    

  def choose_move
    puts "Alors #{@players[0].player_name} quel move veux-tu faire ? Choisis bien ! (ex: A1, B3, C2, ...)"
    print " >> "
    move = gets.chomp
  end

end