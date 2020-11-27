class AddOwneridToComponents < ActiveRecord::Migration[6.0]
  def change
    add_column :components, :owner_id, :integer
  end
end
