class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :same_user, only: [:edit, :destroy]

  def index
    @items = Item.all.order(id: "DESC")
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render action: :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render action: :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :show_category_id, :show_state_id, :shipping_fee_bearer_id,
                                 :shipping_prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def same_user
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

end
