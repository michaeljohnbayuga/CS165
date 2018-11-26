class CreateDormersbedchecks < ActiveRecord::Migration[5.1]
  def change
      create_join_table :dormers, :bedchecks
  end
end
