class AddAttachmentColumn < ActiveRecord::Migration[5.1]
  def change
  	add_column :shows, :attachment, :string
  end
end
