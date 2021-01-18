class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @purchase_history_address = PurchaseHistoryAddress.new
  end

  def create
    
    @purchase_history_address = PurchaseHistoryAddress.new(purchase_history_address_params)
      if @purchase_history_address.valid?
        pay_item
        @purchase_history_address.save
        redirect_to root_path
      else
        render action: :index
      end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_history_address_params
    params.require(:purchase_history_address).permit(:postal_code, :shipping_prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
    amount: @item.price,
    card: purchase_history_address_params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
  )
  end

end
