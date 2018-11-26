class CreateDailyreports < ActiveRecord::Migration[5.1]
  def change
    create_table :dailyreports do |t|
	  t.string :report_id
	  t.string :student_number
      t.string :status, default: "in"
	  t.timestamps
    end
  end
end
