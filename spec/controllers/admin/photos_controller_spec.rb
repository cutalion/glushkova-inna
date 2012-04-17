require 'spec_helper'

describe Admin::PhotosController do
  let(:album) { Factory :album }
  before { sign_in }

  describe "redirect to index after create" do
    before do
      photo = stub(:save => true, :to_json => 'photo')
      Photo.should_receive(:new).and_return(photo)
      post :create, :album_id => album.id
    end
    it { should respond_with :success }
  end

  describe "index" do
    before do
      @ordered_photos = double('ordered photos').as_null_object
      Photo.stub ordered_by_position: @ordered_photos
      controller.stub parent: album
      get :index, album_id: album.id
    end
    it "should show photos ordered by position" do
      assigns(:photos).should == @ordered_photos
    end
  end
end
