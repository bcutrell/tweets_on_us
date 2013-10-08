# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    provider "twitter"
    uid "12345"
    name "Samwise"
    oauth_token "umad"
    oauth_secret "bro?"
  end
end
