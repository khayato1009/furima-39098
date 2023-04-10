class BuyAddress
  include ActiveModel::Model
  attr_accessor :municipality, :area_of_origin_id, :address, :post_code, :telephone_number, :building_name, :user_id, :item_id, :token 

  with_options presence: true do
    validates :municipality
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_of_origin_id
    validates :address
    validates :telephone_number, format: {with: /\A[0-9]{11}\z/ }
    validates :token
  end
  
  def save
    buy = Buy.create(item_id: item_id, user_id: user_id)
    
    Address.create(
      buy_id: buy.id,
      municipality: municipality,
      area_of_origin_id: area_of_origin_id,
      address: address,
      post_code: post_code,
      telephone_number: telephone_number,
      building_name: building_name
    )
  end
end