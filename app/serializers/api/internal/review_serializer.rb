class Api::Internal::ReviewSerializer < ActiveModel::Serializer
  type :review

  belongs_to :user
  belongs_to :item

  attributes(
    :id,
    :body,
    :created_at,
    :updated_at
  )
end
