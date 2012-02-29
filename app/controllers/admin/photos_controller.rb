class Admin::PhotosController < Admin::ApplicationController
  inherit_resources
  belongs_to :album

  before_filter :copy_filedata_parameter_to_photo, only: :create

  def create
    create! do |format|
      format.html { render json: resource }
    end
  end

  private

  def copy_filedata_parameter_to_photo
    params[:photo] ||= {}
    params[:photo][:image] = params[:Filedata]
  end
end
