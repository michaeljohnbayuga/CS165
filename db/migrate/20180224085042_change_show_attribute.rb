class ChangeShowAttribute < ActiveRecord::Migration[5.1]
  def change
    change_table :shows do |t|
      t.rename :show_id, :code
    end
  end
end
