class AddCourseidToVideos < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :course_id, :integer
  end
end
