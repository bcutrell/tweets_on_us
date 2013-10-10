class Group < ActiveRecord::Base
  has_many :tweeters,
    through: :tweeter_groups
  has_many :tweeter_groups

  validates_presence_of :tag
end
