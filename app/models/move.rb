class Move < ActiveRecord::Base
  attr_accessible :act, :align, :game_id, :player_id, :posx, :posy
end
