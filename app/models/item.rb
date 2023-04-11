class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :buy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :area_of_origin
  belongs_to :estimated_sipping_date

  validates :category_id, numericality: { other_than: 1, message: 'を選択してください' }
  validates :condition_id,                 numericality: { other_than: 1, message: 'を選択してください' }
  validates :shipping_cost_id,             numericality: { other_than: 1, message: 'を選択してください' }
  validates :area_of_origin_id, numericality: { other_than: 1, message: 'を選択してください' }
  validates :estimated_sipping_date_id, numericality: { other_than: 1, message: 'を選択してください' }

  with_options presence: true do
    validates :image
    validates :name
    validates :detail
    validates :selling_price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                              presence: { message: 'は数値範囲で入力してください' }
  end
end
