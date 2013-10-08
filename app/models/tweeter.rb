class Tweeter < ActiveRecord::Base
  validates_presence_of :handle
end
