class ChangeLastserviceandnextserviceToDate < ActiveRecord::Migration[6.0]
  def change
    remove_column :components, :last_service_date
    remove_column :components, :next_service_date
    add_column :components, :last_service_date, :date
    add_column :components, :next_service_date, :date
  end
end
