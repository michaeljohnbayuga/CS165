class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.boolean :is_admin, default: false
      t.string :password
      t.string :salt
      t.timestamps
    end
  end
end
