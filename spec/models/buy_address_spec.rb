require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  describe '商品購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buy_address = FactoryBot.build(:buy_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buy_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @buy_address.building_name = ''
        expect(@buy_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @buy_address.post_code = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @buy_address.post_code = '1234567'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'area_of_origin_idを選択していないと保存できないこと' do
        @buy_address.area_of_origin_id = 1
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Area of origin Select")
      end
      it 'municipalityが空だと保存できないこと' do
        @buy_address.municipality = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @buy_address.address = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_numberが空だと保存できないこと' do
        @buy_address.telephone_number = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが12桁以上は保存できないこと' do
        @buy_address.telephone_number = 1234567891234
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'telephone_numberが9桁以下は保存できないこと' do
        @buy_address.telephone_number = 123456789
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'telephone_numberが半角数値のみでないと保存できないこと' do
        @buy_address.telephone_number = '０９０４５５５６６６７'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'user_id（購入者）が空だと購入できない' do
        @buy_address.user_id = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_id（購入商品）が空だと購入できない' do
        @buy_address.item_id = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Item can't be blank")
      end
      
      

      it "tokenが空では登録できないこと" do
        @buy_address.token = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
