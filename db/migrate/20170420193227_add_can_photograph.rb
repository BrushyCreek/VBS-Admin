class AddCanPhotograph < ActiveRecord::Migration[5.1]
  def change
    change_table :kids do |t|
      t.boolean :can_photograph
    end
  end
end
