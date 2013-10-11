# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tweet do
    content "MyString"
    tweeter_id 1
  end
end
