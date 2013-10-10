class Tweeter < ActiveRecord::Base
  has_many :groups,
    through: :tweeter_groups
  has_many :tweeter_groups

  validates_presence_of :handle
end
