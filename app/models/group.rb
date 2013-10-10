class Group < ActiveRecord::Base
  has_many :tweeters,
    through: :tweeter_groups
  has_many :tweeter_groups

  validates_presence_of :tag

RailsAdmin.config {|c| c.label_methods << :tag}

end
