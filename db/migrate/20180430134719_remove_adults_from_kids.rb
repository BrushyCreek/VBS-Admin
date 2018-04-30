class RemoveAdultsFromKids < ActiveRecord::Migration[5.1]
  def change
    change_table :kids do |t|
      t.remove :parent_name, :parent_email, :parent_phone, :pickupper_1_name, :pickupper_1_phone, :pickupper_2_name, :pickupper_2_phone, :pickupper_3_name, :pickupper_3_phone
      t.datetime :note_modified_at
      t.boolean :special_circumstance
    end
  end
end
