class LandingController < ApplicationController
  def index
    @albums = Album.all
  end
end
