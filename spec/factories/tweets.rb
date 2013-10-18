# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tweet do
    content "Nice tweet today"
    tweeter_id 1
    tweet_date { Date.today - 7 }

    trait :today do
      tweet_date { Date.today }
    end

    trait :yesterday do
      tweet_date { Date.yesterday }
    end 

    trait :thirty_one_days_ago do
      tweet_date { Date.today - 31 }
    end
  end

end
