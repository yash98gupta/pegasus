class AddFeesToCourse < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :fees, :integer
  end
end
