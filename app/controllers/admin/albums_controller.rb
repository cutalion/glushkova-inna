class Admin::AlbumsController < Admin::ApplicationController
  inherit_resources

  def create
    create! { admin_albums_path }
  end

  def update
    update! { admin_albums_path }
  end
end
