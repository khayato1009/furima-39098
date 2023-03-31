require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe 'ユーザー新規登録' do
    context '出品できる場合' do
      it "category_idとcondition_idとshipping_cost_idとarea_of_origin_idとestimated_sipping_date_idとselling_priceとnameとdetailが存在すれば出品できる" do
        expect(@item).to be_valid
      end
    end
    context '出品できない場合' do
      it "商品画像を1枚つけることが必須であること。" do
        @item.image = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が必須であること" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it " 商品の説明が必須であること" do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end
      it 'カテゴリーの情報が必須であること' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Password can't be blank")
      end
      it '商品の状態の情報が必須であること。' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Password can't be blank")
      end
      it '配送料の負担の情報が必須であること。' do
        @item.shipping_cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Password can't be blank")
      end
      it "発送元の地域の情報が必須であること。" do
        @item.area_of_origin_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Password can't be blank")
      end
      it "発送までの日数の情報が必須であること。" do
        @item.estimated_sipping_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Password can't be blank")
      end
      it "価格の情報が必須であること。" do
        @item.selling_price  = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Password can't be blank")
      end
      it ' 価格は、¥300~¥9,999,999の間のみ保存可能であること。' do
        @item.selling_price  = '100'
        @item.pselling_price  = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it "価格は半角数値のみ保存可能であること。" do
        @item.selling_price  = '５００'
        @item.pselling_price  = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Password can't be blank")
      end
    end
  end
end
