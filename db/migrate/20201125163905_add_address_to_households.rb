class AddAddressToHouseholds < ActiveRecord::Migration[6.0]
  def change
    add_column :households, :address, :string
  end
end
