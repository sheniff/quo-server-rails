class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.integer :game_id
      t.integer :player_id
      t.string :act
      t.integer :posx
      t.integer :posy
      t.string :align

      t.timestamps
    end
  end
end
