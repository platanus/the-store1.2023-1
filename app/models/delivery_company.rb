class DeliveryCompany < ApplicationRecord
  validates :name, :phone_number, presence: true
end

# == Schema Information
#
# Table name: delivery_companies
#
#  id           :bigint(8)        not null, primary key
#  name         :string
#  phone_number :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
