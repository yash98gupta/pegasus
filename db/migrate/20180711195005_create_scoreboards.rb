class CreateScoreboards < ActiveRecord::Migration[5.2]
  def change
    create_table :scoreboards do |t|
      t.integer :student_id
      t.integer :course_id
      t.integer :marks

      t.timestamps
    end
  end
end
