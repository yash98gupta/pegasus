class AddTotalToScoreboard < ActiveRecord::Migration[5.2]
  def change
    add_column :scoreboards, :total, :integer
  end
end
