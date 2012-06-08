require 'spec_helper'

describe PhotosController do
  let(:album) { create :album }

  describe "index" do
    it "should show photos ordered by position" do
      ordered_photos = double('ordered photos').as_null_object
      Photo.stub ordered_by_position: ordered_photos
      controller.stub parent: album
      get :index, album_id: album.id
      assigns(:photos).should == ordered_photos
    end
  end
end
