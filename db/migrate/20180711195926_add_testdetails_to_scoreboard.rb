class AddTestdetailsToScoreboard < ActiveRecord::Migration[5.2]
  def change
    add_column :scoreboards, :title, :string
  end
end
