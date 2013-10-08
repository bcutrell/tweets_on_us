require 'spec_helper'

describe Tweeter do
  it { should validate_presence_of :handle }
end
