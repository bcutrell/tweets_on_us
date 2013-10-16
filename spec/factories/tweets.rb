# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tweet do
    content "Nice tweet today"
    tweeter_id 1
  end
end
