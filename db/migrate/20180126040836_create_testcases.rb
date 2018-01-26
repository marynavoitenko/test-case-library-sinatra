class CreateTestcases < ActiveRecord::Migration[5.1]
  def change
    create_table :testcases do |t|
      t.string :title
      t.string :description
      t.string :expectedresult
      t.integer :user_id

      t.timestamps
    end
  end
end
