FactoryBot.define do
  factory :item do
    
   name                      {Faker::Name.initials(number: 2)}
   detail                    {}
   category_id               {''}
   condition_id              {''}
   shipping_cost_id          {''}
   area_of_origin_id         {''}
   estimated_sipping_date_id {""}
   selling_price             {'400'}
   image                     {}
   after(:build) do |item|
    # carrierwaveの場合
    item.images << build(:image)
    # ActiveStorageの場合
    item.images.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg', content_type: 'image/jpg')
  end
  end
end
