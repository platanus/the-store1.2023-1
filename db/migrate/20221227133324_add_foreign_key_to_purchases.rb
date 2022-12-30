class AddForeignKeyToPurchases < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :purchases, :delivery_companies, column: :delivery_company_id, validate: false
  end
end
