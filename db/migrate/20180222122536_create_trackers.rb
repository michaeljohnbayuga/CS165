class CreateTrackers < ActiveRecord::Migration[5.1]
  def change
    create_table :trackers do |t|
      t.string :username
      t.string :show_id
      t.integer :season_no
      t.integer :episode_no
      t.references :episode, foreign_key: true

      t.timestamps
    end
  end
end
