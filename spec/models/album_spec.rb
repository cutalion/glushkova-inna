require 'spec_helper'

describe Album do
  it { should have_many :photos }
  it { should validate_presence_of :title }
  
  describe "#random_photo" do
    it "should return first photo for now" do
      photo1 = stub :photo1
      photo2 = stub :photo2
      subject.stub :photos => [photo1, photo2]
      subject.random_photo.should == photo1
    end
  end

  specify { Album.new(:title => 'blabla').to_s.should == 'blabla' }
end
