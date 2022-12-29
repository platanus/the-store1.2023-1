class Api::Internal::PurchaseSerializer < ActiveModel::Serializer
  type :purchase

  belongs_to :user
  belongs_to :item

  attributes(
    :id,
    :status,
    :delivery_date,
    :created_at,
    :updated_at
  )
end
