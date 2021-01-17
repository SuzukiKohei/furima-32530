class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_history_address = PurchaseHistoryAddress.new
  end

  def create
    @purchase_history_address = PurchaseHistoryAddress.new(purchase_history_address_params)   #「UserDonation」に編集
      if @purchase_history_address.valid?
        @purchase_history_address.save
        redirect_to root_path
      else
        render action: :index
      end
  end

  private

  def purchase_history_address_params
    params.require(:purchase_history_address).permit(:postal_code, :shipping_prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
    amount: @item.price[:price],  # 商品の値段
    card: purchase_history_address_params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
  )
  end

end
