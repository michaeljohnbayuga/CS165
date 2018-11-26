class CreateGuards < ActiveRecord::Migration[5.1]
  def change
    create_table :guards do |t|
      t.string :name
      t.string :schedule
      t.timestamps
    end
  end
end
