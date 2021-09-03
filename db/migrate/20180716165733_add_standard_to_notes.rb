class AddStandardToNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :standard, :integer
  end
end
