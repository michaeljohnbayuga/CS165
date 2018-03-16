class CreateEpisodes < ActiveRecord::Migration[5.1]
  def change
    create_table :episodes do |t|
      t.string :show_id
      t.integer :season_no
      t.integer :episode_no
      t.integer :showep_no
      t.string :title
      t.date :air_date
      t.references :season, foreign_key: true

      t.timestamps
    end
  end
end
