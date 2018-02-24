class RemoveEpisodeColumns < ActiveRecord::Migration[5.1]
  def change
    if column_exists?(:episodes, :show_id, :string)
      remove_column :episodes, :show_id, :string
    end

    if column_exists?(:episodes, :season_no, :integer)
      remove_column :episodes, :season_no, :integer
    end
  end
end
