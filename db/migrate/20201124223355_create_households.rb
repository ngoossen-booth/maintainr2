class CreateHouseholds < ActiveRecord::Migration[6.0]
  def change
    create_table :households do |t|
      t.integer :owner_id
      t.string :picture
      t.string :nickname

      t.timestamps
    end
  end
end
