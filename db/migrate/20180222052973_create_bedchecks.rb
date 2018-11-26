class CreateBedchecks < ActiveRecord::Migration[5.1]
  def change
    create_table :bedchecks do |t|
      t.string :student_number
      t.string :sa_name
	  t.string :guard_name
      t.string :date
      t.references :dormer, foreign_key: true
      t.timestamps
    end
  end
end
