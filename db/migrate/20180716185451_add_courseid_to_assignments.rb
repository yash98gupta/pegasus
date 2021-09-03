class AddCourseidToAssignments < ActiveRecord::Migration[5.2]
  def change
    add_column :assignments, :course_id, :integer
  end
end
