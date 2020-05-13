class Player
  attr_accessor :player_name, :plays

  def initialize(name)
    @player_name = name
    @plays = []
  end    

end