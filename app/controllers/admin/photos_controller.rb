class Admin::PhotosController < Admin::ApplicationController
  inherit_resources
  belongs_to :album

  def create
    create! { admin_photos_path }
  end
end
