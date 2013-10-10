class TweeterGroup < ActiveRecord::Base
  belongs_to :tweeter
  belongs_to :group
end
