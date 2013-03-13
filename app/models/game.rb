class Game < ActiveRecord::Base
  attr_accessible :joined, :players
  has_many :moves
end
