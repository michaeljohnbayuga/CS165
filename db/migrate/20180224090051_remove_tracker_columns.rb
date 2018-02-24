class RemoveTrackerColumns < ActiveRecord::Migration[5.1]
  def change
    if column_exists?(:trackers, :username, :string)
      remove_column :trackers , :username, :string
    end

    if column_exists?(:trackers, :show_id, :string)
      remove_column :trackers, :show_id, :string
    end

    if column_exists?(:trackers, :season_no, :integer)
      remove_column :trackers, :season_no, :integer
    end

    if column_exists?(:trackers, :episode_no, :integer)
      remove_column :trackers, :episode_no, :integer
    end
  end
end
