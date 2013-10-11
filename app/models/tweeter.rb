class Tweeter < ActiveRecord::Base
  has_many :groups,
    through: :tweeter_groups
  has_many :tweeter_groups

  validates_presence_of :handle
  validates_uniqueness_of :handle

  RailsAdmin.config {|c| c.label_methods << :handle}
end
