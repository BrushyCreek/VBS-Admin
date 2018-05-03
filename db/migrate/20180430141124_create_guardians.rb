class CreateGuardians < ActiveRecord::Migration[5.1]
  def change
    create_table :guardians do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.boolean :has_wristband
      t.datetime :date_of_wrist_band
      t.belongs_to :family, index: true

      t.timestamps
    end
  end
end
