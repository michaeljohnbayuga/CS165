class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
	 t.string :show_id
      t.string :user_id
      t.timestamps
    end
  end
end
