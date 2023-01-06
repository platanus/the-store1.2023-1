class Api::Internal::ReviewSerializer < ActiveModel::Serializer
  type :review

  belongs_to :user

  attributes(
    :id,
    :body,
    :created_at,
    :updated_at
  )
end
