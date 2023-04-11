require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe 'ユーザー新規登録' do
    context '出品できる場合' do
      it 'imageとcategory_idとcondition_idとshipping_cost_idとarea_of_origin_idとestimated_sipping_date_idとselling_priceとnameとdetailが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '出品できない場合' do
      it 'userが紐づいていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end

      it '商品画像を1枚つけることが必須であること。' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include
      end
      it '商品名が必須であること' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it ' 商品の説明が必須であること' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品説明を入力してください")
      end
      it 'カテゴリーの情報が[---]だと登録できない。' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
      end
      it '商品の状態のが[---]だと登録できない。' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('商品状態を選択してください')
      end
      it '配送料の負担の情報が[---]だと登録できない。' do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を選択してください')
      end
      it '発送元の地域の情報が[---]だと登録できない。' do
        @item.area_of_origin_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を選択してください')
      end
      it '発送までの日数の情報が[---]だと登録できない。' do
        @item.estimated_sipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を選択してください')
      end
      it '価格の情報が必須であること。' do
        @item.selling_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end

      it '価格が300円未満では出品できない' do
        @item.selling_price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は300以上の値にしてください')
      end
      it '価格が9_999_999円を超えると出品できない。' do
        @item.selling_price = '100000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は9999999以下の値にしてください')
      end

      it '価格は半角数値のみ保存可能であること。' do
        @item.selling_price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end
    end
  end
end
