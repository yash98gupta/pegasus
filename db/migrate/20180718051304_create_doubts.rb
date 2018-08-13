class CreateDoubts < ActiveRecord::Migration[5.2]
  def change
    create_table :doubts do |t|
      t.text :title
      t.text :description
      t.integer :student_id
      t.integer :course_id
      t.integer :visibility

      t.timestamps
    end
  end
end
