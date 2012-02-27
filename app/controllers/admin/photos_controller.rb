class Admin::PhotosController < ApplicationController
  inherit_resources

  def create
    create! { admin_photos_path }
  end
end
