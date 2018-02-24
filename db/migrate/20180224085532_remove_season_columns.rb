class RemoveSeasonColumns < ActiveRecord::Migration[5.1]
  def change
    if column_exists?(:seasons, :show_id, :string)
      remove_column :seasons, :show_id, :string
    end
  end
end
