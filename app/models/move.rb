class Move < ActiveRecord::Base
  attr_accessible :act, :align, :player_id, :posx, :posy
  belongs_to :game
end
