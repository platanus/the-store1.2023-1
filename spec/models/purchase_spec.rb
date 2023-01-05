require 'rails_helper'

RSpec.describe Purchase, type: :model do
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
    let(:delivery_company) { nil }
    let(:delivery_date) { nil }
    let(:status) { :pending }

    let(:purchase) do
      build(
        :purchase,
        delivery_company: delivery_company,
        delivery_date: delivery_date,
        status: status
      )
    end

    it { expect(purchase).not_to validate_presence_of(:delivery_date) }
    it { expect(purchase).not_to validate_presence_of(:delivery_company) }

    context 'with delivery company' do
      let(:delivery_company) { create(:delivery_company) }

      it { expect(purchase).to validate_presence_of(:delivery_date) }
      it { expect(purchase).not_to validate_presence_of(:delivery_company) }

      context "with delivery date in the past" do
        let(:delivery_date) { 1.day.ago }

        it { expect(purchase).not_to be_valid }
        it { expect(purchase).to validate_presence_of(:delivery_company) }
      end

      context "with delivery date in the future" do
        let(:delivery_date) { 1.day.from_now }

        it { expect(purchase).to be_valid }
      end
    end

    context 'with delivered status' do
      let(:status) { :delivered }

      it { expect(purchase).to validate_presence_of(:delivery_date) }
      it { expect(purchase).to validate_presence_of(:delivery_company) }
    end
  end
end
