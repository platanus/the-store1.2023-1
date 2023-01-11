class Review < ApplicationRecord
  belongs_to :user
  belongs_to :item
end

# == Schema Information
#
# Table name: reviews
#
#  id         :bigint(8)        not null, primary key
#  body       :string
#  user_id    :bigint(8)        not null
#  item_id    :bigint(8)        not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  rating     :integer
#
# Indexes
#
#  index_reviews_on_item_id  (item_id)
#  index_reviews_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (item_id => items.id)
#  fk_rails_...  (user_id => users.id)
#
