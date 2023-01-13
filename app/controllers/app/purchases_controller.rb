class App::PurchasesController < App::BaseController
  def index
    @purchases = current_user.purchases.order(created_at: :desc).includes(:item)
  end

  def show
    @purchase = current_user.purchases.find(purchase_params[:id])
  end

  private

  def purchase_params
    params.permit(:id)
  end
end
