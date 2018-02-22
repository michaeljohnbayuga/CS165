class CreateShows < ActiveRecord::Migration[5.1]
  def change
    create_table :shows do |t|
      t.string :show_id
      t.string :name
      t.string :network
      t.string :start_year
      t.string :end_year

      t.timestamps
    end
  end
end
