FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    double_byte_first_name { '中島' }
    double_byte_last_name { '太郎' }
    double_byte_first_name_kana { 'ナカシマ' }
    double_byte_last_name_kana { 'タロウ' }
    date_of_birth { '2001-10-3' }
    password { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
  end
end
