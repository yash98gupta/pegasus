class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.text :title
      t.text :description
      t.integer :standard
      t.integer :description

      t.timestamps
    end
  end
end
