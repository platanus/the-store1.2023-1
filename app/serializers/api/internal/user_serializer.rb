class UserSerializer < ActiveModel::Serializer
  type :user

  attributes(
    :id,
    :email,
    :name
  )
end
