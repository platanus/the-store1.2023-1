require 'rails_helper'

RSpec.describe Review, type: :model do
  context 'with valid attributes' do
    it { expect(build(:review)).to be_valid }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:item) }
  end
end
