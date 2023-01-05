require 'rails_helper'

RSpec.describe DeliveryCompany, type: :model do
  context 'with valid attributes' do
    it { expect(build(:delivery_company)).to be_valid }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:phone_number) }
  end
end
