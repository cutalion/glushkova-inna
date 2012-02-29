class Photo < ActiveRecord::Base
  mount_uploader :image, PhotoUploader

  belongs_to :album

  validates :image, presence: true
end
