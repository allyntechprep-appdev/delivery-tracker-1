class AddDateToDelivery < ActiveRecord::Migration[6.0]
  def change
    add_column :deliveries, :arrival, :date
  end
end
