class CreateTimetables < ActiveRecord::Migration[5.2]
  def change
    create_table :timetables do |t|
      t.text :title
      t.text :description
      t.integer :course_id
      t.integer :standard

      t.timestamps
    end
  end
end
