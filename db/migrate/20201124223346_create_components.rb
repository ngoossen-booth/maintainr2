class CreateComponents < ActiveRecord::Migration[6.0]
  def change
    create_table :components do |t|
      t.integer :equipment_id
      t.datetime :last_service_date
      t.datetime :next_service_date
      t.string :description

      t.timestamps
    end
  end
end
