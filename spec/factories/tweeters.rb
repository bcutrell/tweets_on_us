# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tweeter do
    handle "launchacademy_"
    trait :with_tweet do 
      after(:create) do |tweeter|
        FactoryGirl.create(:tweet, tweeter: tweeter)
      end
    end
  end

end
