require 'faker'

# FactoryGirl.define do
#   factory :user do |f|
#     f.sequence(:email) { |n| "foo#{n}@example.com" }
#     f.password "password"
#   end
# end
FactoryGirl.define do
  factory :user do
    # first_name            Faker::Name.first_name
    # last_name             Faker::Name.last_name
    # phone                 Faker::PhoneNumber.cell_phone
    email { Faker::Internet.email }
    password "password"
    role_id Random.rand(2..6)
    # password_confirmation "password"
  end
end