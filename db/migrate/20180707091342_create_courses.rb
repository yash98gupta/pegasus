class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :subject_name
      t.integer :standard

      t.timestamps
    end
  end
end
