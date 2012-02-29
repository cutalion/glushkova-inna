class LandingController < ApplicationController
  def index
    @albums = Album.with_photos
  end
end
