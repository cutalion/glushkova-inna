class PhotosController < ApplicationController
  inherit_resources
  belongs_to :album
  layout Proc.new { |controller| controller.request.xhr? ? 'popup' : 'application' }

  def index
    @photos = parent.photos.ordered_by_position
  end
end
