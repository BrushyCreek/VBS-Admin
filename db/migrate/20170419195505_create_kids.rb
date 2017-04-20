class CreateKids < ActiveRecord::Migration[5.1]
  def change
    create_table :kids do |t|
      t.string :first_name 
      t.string :last_name 
      t.date :birthdate 
      t.integer :last_grade 

      t.timestamps
    end
  end
end
