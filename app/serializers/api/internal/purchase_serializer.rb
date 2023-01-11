class Api::Internal::PurchaseSerializer < ActiveModel::Serializer
  type :purchase

  belongs_to :user
  belongs_to :item
  belongs_to :delivery_company, optional: true

  attributes(
    :id,
    :status,
    :delivery_date,
    :created_at
  )
end
