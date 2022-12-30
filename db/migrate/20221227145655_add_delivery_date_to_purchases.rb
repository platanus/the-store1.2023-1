class AddDeliveryDateToPurchases < ActiveRecord::Migration[6.1]
  def change
    add_column :purchases, :delivery_date, :date, optional: true
  end
end
