class AddOwneridToEquipment < ActiveRecord::Migration[6.0]
  def change
    add_column :equipment, :owner_id, :integer
  end
end
