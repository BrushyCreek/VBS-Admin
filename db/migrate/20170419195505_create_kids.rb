class CreateKids < ActiveRecord::Migration[5.1]
  def change
    create_table :kids do |t|
      t.string :first_name null: false
      t.string :last_name null: false
      t.date :birthdate null: false
      t.integer :last_grade null: false

      t.timestamps
    end
  end
end
