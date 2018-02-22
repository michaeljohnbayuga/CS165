class CreateSeasons < ActiveRecord::Migration[5.1]
  def change
    create_table :seasons do |t|
      t.string :show_id
      t.integer :season_no
      t.integer :no_of_episodes
      t.date :start_date
      t.date :end_date
      t.references :show, foreign_key: true

      t.timestamps
    end
  end
end
