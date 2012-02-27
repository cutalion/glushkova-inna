require 'spec_helper'

describe Admin::PhotosController do
  describe "redirect to index after create" do
    before do
      photo = stub(:save => true)
      Photo.should_receive(:new).and_return(photo)
      post :create
    end
    it { should redirect_to admin_photos_path }
  end
end
