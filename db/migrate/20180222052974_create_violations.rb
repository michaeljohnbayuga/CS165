class CreateViolations < ActiveRecord::Migration[5.1]
  def change
    create_table :violations do |t|
      t.string :student_number
      t.string :admin_name
	  t.integer :major, default: 0
      t.integer :minor, default: 0
      t.timestamps
    end
  end
end
