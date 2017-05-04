class ConnectingGroupsAndKidsAndVolunteersAndLocations < ActiveRecord::Migration[5.1]
  def change
    change_table :kids do |t|
      t.belongs_to :group, index: true
    end
    change_table :volunteers do |t|
      t.belongs_to :leader, polymorphic: true, index: true
    end
  end
end
