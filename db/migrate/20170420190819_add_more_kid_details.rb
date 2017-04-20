class AddMoreKidDetails < ActiveRecord::Migration[5.1]
  def change
    change_table :kids do |t|
      t.string :pickupper_1_name
      t.integer :pickupper_1_phone
      t.string :pickupper_2_name
      t.integer :pickupper_2_phone
      t.string :pickupper_3_name
      t.integer :pickupper_3_phone
      t.boolean :highlight, default: false
    end
  end
end
