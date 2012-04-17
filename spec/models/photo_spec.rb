require 'spec_helper'

describe Photo do
  it { should belong_to :album }
  it { should validate_presence_of :image }

  specify ".ordered_by_position should show lower position first" do
    album  = Factory :album
    photo1 = Factory :photo, album_id: album.id, position: 20
    photo2 = Factory :photo, album_id: album.id, position: 10
    album.photos.ordered_by_position.should == [photo2, photo1]
  end

  specify ".sort should update photos position" do
    album  = Factory :album
    photo1 = Factory :photo, position: 0, album: album
    photo2 = Factory :photo, position: 1, album: album

    Photo.sort [photo2.id, photo1.id]

    Photo.ordered_by_position.should == [photo2, photo1]
  end
end
