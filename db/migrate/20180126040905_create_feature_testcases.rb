class CreateFeatureTestcases < ActiveRecord::Migration[5.1]
  def change
    create_table :feature_testcases do |t|
      t.integer :feature_id
      t.integer :testcase_id
    end
  end
end
