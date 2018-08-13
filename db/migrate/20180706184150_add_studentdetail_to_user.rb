class AddStudentdetailToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :school, :string
  end
end
