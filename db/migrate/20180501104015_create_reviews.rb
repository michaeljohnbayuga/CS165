class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :text
      t.references :show, foreign_key: true
    end
  end
end
