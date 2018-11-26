class CreateDormers < ActiveRecord::Migration[5.1]
  def change
    create_table :dormers do |t|
      t.string :student_number
      t.string :name
      t.integer:room_number
      t.string :sex
	  t.string :course_year
	  t.string :attachment
	  t.boolean :is_sa, default: false
      t.string :status, default: "in"
      t.references :bedcheck, foreign_key: true
      t.timestamps
    end
  end
end
