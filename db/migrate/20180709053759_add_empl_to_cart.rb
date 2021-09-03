class AddEmplToCart < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :emp_name, :string
  end
end
