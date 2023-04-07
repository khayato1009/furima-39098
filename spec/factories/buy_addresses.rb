FactoryBot.define do
  factory :buy_address do
    municipality {'青森市'}
    area_of_origin_id {'2'}
    address {'1-1'}
    post_code {'123-4567'}
    telephone_number {'09087678787'}
    association :user
    association :item
  end
end
