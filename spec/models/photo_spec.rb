require 'spec_helper'

describe Photo do
  it { should validate_presence_of :image }
end
