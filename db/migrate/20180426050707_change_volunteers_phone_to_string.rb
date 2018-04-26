class ChangeVolunteersPhoneToString < ActiveRecord::Migration[5.1]
  def change
    change_column :volunteers, :phone, :string
  end
end
