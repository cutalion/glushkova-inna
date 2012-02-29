require 'spec_helper'

describe Album do
  it { should have_many :photos }
  it { should validate_presence_of :title }
end
