class CreateDeliveryCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :delivery_companies do |t|
      t.string :name
      t.string :phone_number, null: false

      t.timestamps
    end
  end
end
