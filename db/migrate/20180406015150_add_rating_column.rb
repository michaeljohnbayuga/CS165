class AddRatingColumn < ActiveRecord::Migration[5.1]
  def change
  	add_column :ratings, :rtg, :float
  end
end
