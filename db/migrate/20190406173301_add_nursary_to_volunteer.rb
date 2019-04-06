class AddNursaryToVolunteer < ActiveRecord::Migration[5.2]
  def change
    add_column :volunteers, :need_nursary, :bool
  end
end
