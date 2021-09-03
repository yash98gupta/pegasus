class AddDatefeesToCart < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :end_date, :date
    add_column :carts, :fees, :integer
  end
end
