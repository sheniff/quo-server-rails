class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :joined
      t.integer :players

      t.timestamps
    end
  end
end
