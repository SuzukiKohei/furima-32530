require 'rails_helper'
RSpec.describe PurchaseHistoryAddress, type: :model do
  before do
    @purchase_history_address = FactoryBot.build(:purchase_history_address)
  end

  describe "商品購入機能" do
    context "商品購入がうまくいく時" do
      it "token,postal_code,shipping_prefecture_id,city,address,phone_numberがあれば購入できる" do
        expect(@purchase_history_address).to be_valid
      end
    end

    context "商品購入がうまくいかない時" do
      it 'tokenが空だと登録できない' do
        @purchase_history_address.token = ''
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと登録できない' do
        @purchase_history_address.postal_code = ''
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'shipping_prefecture_idが空だと登録できない' do
        @purchase_history_address.shipping_prefecture_id = ''
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Shipping prefecture can't be blank")
      end
      it 'cityが空だと登録できない' do
        @purchase_history_address.city = ''
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと登録できない' do
        @purchase_history_address.address = ''
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと登録できない' do
        @purchase_history_address.phone_number = ''
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Phone number can't be blank")
      end
    end
  end
end
