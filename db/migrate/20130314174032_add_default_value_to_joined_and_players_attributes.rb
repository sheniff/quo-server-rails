class AddDefaultValueToJoinedAndPlayersAttributes < ActiveRecord::Migration
  def change
    change_column :games, :joined, :integer, :default => 1
    change_column :games, :players, :integer, :default => 2
  end
end
