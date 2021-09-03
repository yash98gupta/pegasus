class AddCourseidToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :course_id, :integer
  end
end
