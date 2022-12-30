class AddDeliveryCompanyToPurchases < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def change
    add_reference :purchases, :delivery_company, optional: true, index: {algorithm: :concurrently}
  end
end
