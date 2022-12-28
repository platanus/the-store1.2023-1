class App::ItemsController < App::BaseController
  def index
    @items = Item.all
  end

  def show
    item
  end

  private

  def item
    @item ||= Item.find(item_params[:id])
  end

  def item_params
    params.permit(:id)
  end
end
