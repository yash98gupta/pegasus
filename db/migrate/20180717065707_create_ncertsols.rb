class CreateNcertsols < ActiveRecord::Migration[5.2]
  def change
    create_table :ncertsols do |t|
      t.text :title
      t.text :description
      t.integer :course_id
      t.integer :standard

      t.timestamps
    end
  end
end
