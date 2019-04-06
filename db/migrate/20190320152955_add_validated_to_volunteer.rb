class AddValidatedToVolunteer < ActiveRecord::Migration[5.2]
  def change
    add_column :volunteers, :validated, :boolean
  end
end
