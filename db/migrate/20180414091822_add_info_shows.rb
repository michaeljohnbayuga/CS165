class AddInfoShows < ActiveRecord::Migration[5.1]
  def change
  	create_table :info do |t|
      t.string :show_id
      t.string :director
      t.text :casts
      t.text :synopsis
      t.integer :runtime
      t.references :show, foreign_key: true

      t.timestamps
    end
  end
end
