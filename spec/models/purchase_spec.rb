require 'rails_helper'

RSpec.fdescribe Purchase, type: :model do
  context 'with valid attributes' do
    it { expect(build(:purchase)).to be_valid }
    it { expect(build(:purchase, :with_delivery_company)).to be_valid }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:item) }
    it { is_expected.to belong_to(:delivery_company).optional }
  end

  describe 'delegations' do
    it { is_expected.to delegate_method(:name).to(:item).with_prefix }
  end

  describe 'validations' do
    context 'with delivery company' do
      it do
        expect(build(:purchase, :with_delivery_company)).to validate_presence_of(:delivery_date)
      end

      it do
        expect(
          build(:purchase, :with_delivery_company)
        ).to validate_presence_of(:delivery_company)
      end
    end

    context 'without delivery company' do
      it { expect(build(:purchase)).not_to validate_presence_of(:delivery_date) }
      it { expect(build(:purchase)).not_to validate_presence_of(:delivery_company) }
    end
  end
end
