require 'rails_helper'

RSpec.describe PurchaseLogAddress, type: :model do
  describe '商品購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_log_address = FactoryBot.build(:purchase_log_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_log_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @purchase_log_address.receiver_building_name = ''
        expect(@purchase_log_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号がからの時' do
        @purchase_log_address.receiver_postal_code = ''
        @purchase_log_address.valid?
        expect(@purchase_log_address.errors.full_messages).to include("Receiver postal code can't be blank")
      end
      it '郵便番号がハイフン無しの時' do
        @purchase_log_address.receiver_postal_code = '1234567'
        @purchase_log_address.valid?
        expect(@purchase_log_address.errors.full_messages).to include("Receiver postal code is invalid. Include hyphen(-)")
      end
      it '郵便番号が全角数字の時' do
        @purchase_log_address.receiver_postal_code = '１２３-４５６７'
        @purchase_log_address.valid?
        expect(@purchase_log_address.errors.full_messages).to include("Receiver postal code is invalid. Include hyphen(-)")
      end
      it '郵便番号が3-4以外の時' do
        @purchase_log_address.receiver_postal_code = '1234-567'
        @purchase_log_address.valid?
        expect(@purchase_log_address.errors.full_messages).to include("Receiver postal code is invalid. Include hyphen(-)")
      end
      it '都道府県が空の時' do
        @purchase_log_address.user_area_id = 1
        @purchase_log_address.valid?
        expect(@purchase_log_address.errors.full_messages).to include("User area must be other than 1")
      end
      it '市町村が空の時' do
        @purchase_log_address.receiver_cities = ''
        @purchase_log_address.valid?
        expect(@purchase_log_address.errors.full_messages).to include("Receiver cities can't be blank")
      end
      it '電話番号が空の時' do
        @purchase_log_address.receiver_phone_number = ''
        @purchase_log_address.valid?
        expect(@purchase_log_address.errors.full_messages).to include("Receiver phone number can't be blank")
      end
      it '電話番号が全角の時' do
        @purchase_log_address.receiver_phone_number = '１２３４５６７８９０'
        @purchase_log_address.valid?
        expect(@purchase_log_address.errors.full_messages).to include("Receiver phone number is invalid.")
      end
      it '電話番号が12桁以上の時' do
        @purchase_log_address.receiver_phone_number = '123-4567-8912'
        @purchase_log_address.valid?
        expect(@purchase_log_address.errors.full_messages).to include("Receiver phone number is invalid.")
      end
      it '電話番号が９桁以下の時' do
        @purchase_log_address.receiver_phone_number = '123456789'
        @purchase_log_address.valid?
        expect(@purchase_log_address.errors.full_messages).to include("Receiver phone number is invalid.")
      end
      it '電話番号が数字以外の時' do
        @purchase_log_address.receiver_phone_number = 'あいうえお'
        @purchase_log_address.valid?
        expect(@purchase_log_address.errors.full_messages).to include("Receiver phone number is invalid.")
      end

      it '電話番号が英数字混同の時' do
        @purchase_log_address.receiver_phone_number = '123abcd4567'
        @purchase_log_address.valid?
        expect(@purchase_log_address.errors.full_messages).to include("Receiver phone number is invalid.")
      end

      it "tokenが空では登録できないこと" do
        @purchase_log_address.token = nil
        @purchase_log_address.valid?
        expect(@purchase_log_address.errors.full_messages).to include("Token can't be blank")
      end

      it "Userが紐ついていないと登録できないこと" do
        @purchase_log_address.user_id = nil
        @purchase_log_address.valid?
        expect(@purchase_log_address.errors.full_messages).to include("User can't be blank")
      end

      it "Itemが紐ついていないと登録できないこと" do
        @purchase_log_address.item_id = nil
        @purchase_log_address.valid?
        expect(@purchase_log_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
