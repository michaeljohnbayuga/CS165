class AddCastsTable < ActiveRecord::Migration[5.1]
  def change
  	create_table :casts do |t|
  	 # cast id - automatic
  	 t.string :name
	 t.string :show_id
      t.timestamps
    end
  end
end
