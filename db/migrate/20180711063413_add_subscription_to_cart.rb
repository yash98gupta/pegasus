class AddSubscriptionToCart < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :subscription, :boolean , default: false
  end
end
