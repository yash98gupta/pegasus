class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :title
      t.text :description
      t.integer :student_id
      t.integer :doubt_id

      t.timestamps
    end
  end
end
