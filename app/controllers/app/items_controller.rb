class App::ItemsController < App::BaseController
  def index
    @items = Item.all
  end

  def show
    item
    reviews
    bought?
    reviewed?
  end

  private

  def item
    @item ||= Item.find(item_params[:id])
  end

  def reviews
    @reviews ||= item.reviews.order(created_at: :desc).includes([:user])
  end

  def bought?
    @bought ||= current_user.purchases.find_by(item_id: item.id) ? 1 : 0
  end

  def reviewed?
    @reviewed ||= reviews.find_by(user_id: current_user.id) ? 1 : 0
  end

  def item_params
    params.permit(:id)
  end
end
