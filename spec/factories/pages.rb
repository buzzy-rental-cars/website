# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page do
    name "MyString"
    slug "MyString"
    description "MyString"
    body "MyText"
    published false
  end
end
