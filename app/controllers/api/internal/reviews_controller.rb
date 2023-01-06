class Api::Internal::ReviewsController < Api::Internal::BaseController
  before_action :authenticate_user!

  def create
    respond_with Review.create!(review_params.merge(user: current_user))
  end

  private

  def review_params
    params.require(:review).permit(
      :item_id,
      :body
    )
  end
end
