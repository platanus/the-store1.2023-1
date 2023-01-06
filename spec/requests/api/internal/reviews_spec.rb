require 'rails_helper'

RSpec.describe "Api::Internal::ReviewsControllers", type: :request do
  let(:item) { create(:item) }
  let(:user) { create(:user) }

  describe 'POST /create' do
    let(:params) { { item_id: item.id, body: Faker::Lorem.words } }

    let(:attributes) do
      JSON.parse(response.body)['review'].symbolize_keys
    end

    def perform
      post '/api/internal/reviews', params: { review: params }
    end

    it { expect(Review.count).to eq(0) }

    context 'with authorized user' do
      before do
        sign_in(user)
        perform
      end

      it 'creates a review' do
        expect(Review.count).to eq(1)
      end

      it { expect(attributes[:item]["id"]).to eq(item.id) }
      it { expect(attributes[:user]["id"]).to eq(user.id) }
      it { expect(response.status).to eq(201) }
    end

    context 'with unauthenticated user' do
      before { perform }

      it { expect(response.status).to eq(401) }
    end
  end
end
