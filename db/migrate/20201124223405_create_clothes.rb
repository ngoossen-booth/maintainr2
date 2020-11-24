class CreateClothes < ActiveRecord::Migration[6.0]
  def change
    create_table :clothes do |t|
      t.text :description
      t.integer :home_id
      t.integer :quantity

      t.timestamps
    end
  end
end
