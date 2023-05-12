class AddDetailsToDelivery < ActiveRecord::Migration[6.0]
  def change
    add_column :deliveries, :details, :string
  end
end
