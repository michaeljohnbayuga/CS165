class CreateStudentassistants < ActiveRecord::Migration[5.1]
  def change
    create_table :studentassistants do |t|
	  t.string :sa_id
      t.string :student_number
      t.string :name
	  t.string :schedule
      t.timestamps
    end
  end
end
