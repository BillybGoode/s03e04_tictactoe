require 'player'

class Game < Player
  attr_accessor :board, :players

  def initialize()
    @board = {"A" => [nil, nil, nil], "B" => [nil, nil, nil], "C" => [nil, nil, nil]}
    @players = []

    for i in 0..1
        puts "Veuillez entrer le pseudo du joueur #{i+1} !!!"
        print " >> "
        @players << Player.new(gets.chomp) 
    end
  end

  def self.ask_name
    puts "Quel est ton nom joueur(e) ?"
    print "  >> "
    # binding.pry
    self.players << Player.new(gets.chomp).player_name
  end

  def self.board_is_full
    status = true
    @board.flatten(2).each do |cell| 
        binding.pry
        if cell == nil
          status = false
          break
        end
    end
    status
  end
end