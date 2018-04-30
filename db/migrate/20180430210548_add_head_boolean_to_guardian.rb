class AddHeadBooleanToGuardian < ActiveRecord::Migration[5.1]
  def change
    change_table :guardians do |t|
      t.boolean :is_head
    end
  end
end
