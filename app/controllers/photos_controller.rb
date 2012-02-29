class PhotosController < ApplicationController
  inherit_resources
  belongs_to :album
end
