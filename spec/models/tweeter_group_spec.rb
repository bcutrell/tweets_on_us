require 'spec_helper'

describe TweeterGroup do
  it { should belong_to :tweeter }
  it { should belong_to :group }  
end
