class AddUdetailToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :standard, :integer
  end
end
