require 'spec_helper'

describe Album do
  it { should have_many :photos }
  it { should validate_presence_of :title }
  
  describe "#cover" do
    it "should return first photo ordered by position for now" do
      photo1 = stub :photo1
      photo2 = stub :photo2
      subject.stub_chain :photos, :ordered_by_position => [photo1, photo2]
      subject.cover.should == photo1
    end
  end

  specify { Album.new(:title => 'blabla').to_s.should == 'blabla' }
end
