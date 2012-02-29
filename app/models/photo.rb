class Photo < ActiveRecord::Base
  mount_uploader :image, PhotoUploader

  belongs_to :album

  validates :image, :album_id, presence: true
end
