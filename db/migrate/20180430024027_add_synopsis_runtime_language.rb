class AddSynopsisRuntimeLanguage < ActiveRecord::Migration[5.1]
  def change
  	add_column :shows, :runtime, :string
  	add_column :shows, :language, :string
  	add_column :shows, :synopsis, :text
  end
end
