class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      return redirect_to root_path
    end
    render :new
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :show_category_id, :show_state_id, :shipping_fee_bearer_id,
                                 :shipping_prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

end
