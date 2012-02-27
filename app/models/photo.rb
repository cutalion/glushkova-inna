class Photo < ActiveRecord::Base
  mount_uploader :image, PhotoUploader

  validates :image, presence: true
end
