# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tweet do
    content "Nice tweet today"
    tweeter_id 1

    trait :today do
      tweet_date { Date.today }
    end

    trait :yesterday do
      tweet_date { Date.yesterday }
    end 
  end

end
