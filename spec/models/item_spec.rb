require 'rails_helper'
RSpec.describe Item,type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it 'name,explanation,show_category_id,show_state_id,shipping_fee_bearer_id,shipping_prefecture_id,shipping_day_id,price,imageが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'explanationが空だと登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'show_category_idが空だと登録できない' do
        @item.show_category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Show category can't be blank")
      end
      it 'show_state_idが空だと登録できない' do
        @item.show_state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Show state can't be blank")
      end
      it 'shipping_fee_bearer_idが空だと登録できない' do
        @item.shipping_fee_bearer_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee bearer can't be blank")
      end
      it 'shipping_prefecture_idが空だと登録できない' do
        @item.shipping_prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping prefecture can't be blank")
      end
      it 'shipping_day_idが空だと登録できない' do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it 'show_category_idが0だと登録できない' do
        @item.show_category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Show category must be other than 0")
      end
      it 'show_state_idが0だと登録できない' do
        @item.show_state_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Show state must be other than 0")
      end
      it 'shipping_fee_bearer_idが0だと登録できない' do
        @item.shipping_fee_bearer_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee bearer must be other than 0")
      end
      it 'shipping_prefecture_idが0だと登録できない' do
        @item.shipping_prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping prefecture must be other than 0")
      end
      it 'shipping_day_idが0だと登録できない' do
        @item.shipping_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day must be other than 0")
      end
      it 'priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが半角数字以外だと登録できない（全角）' do
        @item.price = '強力粉薄力粉'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが半角数字以外だと登録できない（半角英語）' do
        @item.price = 'aaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが300~9999999以外だと登録できない（下限）' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが300~9999999以外だと登録できない（上限）' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
