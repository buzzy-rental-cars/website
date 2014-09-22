# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vehicle_type do
    name "MyString"
    slug "MyString"
    description "MyText"
    published false
  end
end
