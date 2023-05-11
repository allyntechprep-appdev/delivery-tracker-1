class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string :content
      t.string :status
      t.integer :user_id

      t.timestamps
    end
  end
end
