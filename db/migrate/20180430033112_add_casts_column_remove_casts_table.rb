class AddCastsColumnRemoveCastsTable < ActiveRecord::Migration[5.1]
  def change
  	add_column :shows, :casts, :string
  	drop_table :casts
  end
end
