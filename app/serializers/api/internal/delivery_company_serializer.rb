class Api::Internal::DeliveryCompanySerializer < BaseSerializer
  type :delivery_company

  attributes(
    :id,
    :name,
    :phone_number,
    :created_at
  )
end
