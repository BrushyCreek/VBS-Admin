class RenameGuardianHeadColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :guardians, :is_head, :head
  end
end
