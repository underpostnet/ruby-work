FactoryBot.define do
  factory :contact do
    full_name { FFaker::Name.first_name }
    phone { FFaker::PhoneNumber.phone_number }
    city { FFaker::Lorem.word }
  end
end