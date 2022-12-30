class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :delivery_company, optional: true

  enum status: { pending: 0, delivered: 1 }

  delegate :name, to: :item, prefix: true
  validates :delivery_date, presence: true, if: :delivery_company_id
  validates :delivery_company, presence: true, if: :delivery_date
  # if status is delivered, validate that there is a delivery_date and a delivery_company
  # validate that if there is a delivery_date, it is in the future
end

# == Schema Information
#
# Table name: purchases
#
#  id                  :bigint(8)        not null, primary key
#  user_id             :bigint(8)        not null
#  item_id             :bigint(8)        not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  status              :integer          default("pending"), not null
#  delivery_company_id :bigint(8)
#  delivery_date       :date
#
# Indexes
#
#  index_purchases_on_delivery_company_id  (delivery_company_id)
#  index_purchases_on_item_id              (item_id)
#  index_purchases_on_user_id              (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (delivery_company_id => delivery_companies.id)
#  fk_rails_...  (item_id => items.id)
#  fk_rails_...  (user_id => users.id)
#
