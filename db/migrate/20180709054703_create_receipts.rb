class CreateReceipts < ActiveRecord::Migration[5.2]
  def change
    create_table :receipts do |t|
      t.integer :student_id
      t.integer :subject_id
      t.date :end_date
      t.integer :fees
      t.string :emp_name

      t.timestamps
    end
  end
end
