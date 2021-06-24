require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品ができるとき' do
      it 'name・description・detail_category・detail_condition・delivery_charge・user_area・delivery_time・priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができない時' do
      it 'nameが登録できない時' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明が空の時' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリーが登録できない時' do
        @item.detail_category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail category is not a number")
      end

      it 'カテゴリーが1だとできない' do
        @item.detail_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail category must be other than 1")
      end
  
      it '商品の状態が登録できないの時' do
        @item.detail_condition = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail condition is not a number")
      end

      it '商品の状態が1だとできない' do
        @item.detail_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail condition must be other than 1")
      end

      it '配送料の負担が登録できないの時' do
        @item.delivery_charge = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge is not a number")
      end

      it '配送料の負担が1だとできない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge must be other than 1")
      end

      it '発送元の地域が空の時' do
        @item.user_area = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User area is not a number")
      end

      it '発送元の地域が1だとできない' do
        @item.user_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("User area must be other than 1")
      end
  
      it '発送までの日数が空の時' do
        @item.delivery_time = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time is not a number")
      end

      it '発送までの日数が1だとできない' do
        @item.delivery_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time must be other than 1")
      end

      it '価格が空の時' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
  
      it '価格が300未満の時' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
  
      it '価格が10000000以上の時' do
         @item.price = 10000000
         @item.valid?
         expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
  
      it '価格が全角数値の時' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end

      it '半角英数混合では登録できない' do
        @item.price = 'aaa333'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it '半角英語だけでは登録できないこと' do
        @item.price = 'aaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
  
      it '画像が空の時' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end