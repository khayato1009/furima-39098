FactoryBot.define do
  factory :item do
    after(:image) do |item|
    item.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end

   name                      {Faker::Name.initials(number: 2)}
   estimated_sipping_date_id {""}
   detail                    {'2'}
   category_id               {'3'}
   condition_id              {'2'}
   shipping_cost_id          {'3'}
   area_of_origin_id         {'2'}
   estimated_sipping_date_id {'2'}
   selling_price             {'400'}
   association :user
    
  end
end
