class AddOwnerToClothes < ActiveRecord::Migration[6.0]
  def change
    add_column :clothes, :owner_id, :integer
  end
end
