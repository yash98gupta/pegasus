class AddCourseidToNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :course_id, :integer
  end
end
