class AddKidDetails < ActiveRecord::Migration[5.1]
  def change
    change_table :kids do |t|
      t.remove :last_grade
      t.integer :last_grade_id
      t.string :gender
      t.string :address
      t.string :city
      t.string :state
      t.integer :zipcode
      t.string :parent_name
      t.string :parent_email
      t.integer :parent_phone
      t.boolean :church_member
      t.string :invited_by
      t.integer :tshirt_size_id
      t.boolean :allergies
      t.text :allergies_notes
      t.boolean :medical_issues
      t.text :medical_issues_notes
      t.string :buddy_request
      t.text :notes
    end 
  end
end
