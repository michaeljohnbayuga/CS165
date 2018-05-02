class AddDirectorColumn < ActiveRecord::Migration[5.1]
  def change
  	add_column :shows, :director, :string
  end
end
