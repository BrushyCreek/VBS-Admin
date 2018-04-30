class UpdateKids < ActiveRecord::Migration[5.1]
  def change
    change_table :kids do |t|
      t.remove :address, :city, :state, :zipcode
      t.belongs_to :families, index:true
    end

    change_table :families do |t|
      t.string "address"
      t.string "city"
      t.string "state"
      t.integer "zipcode"
    end
  end
end
