class Photo < ActiveRecord::Base
  mount_uploader :image, PhotoUploader

  belongs_to :album

  validates :image, :album_id, presence: true

  def thumb_url
    image.thumb.url
  end

  def small_url
    image.small.url
  end

  def as_json(options = {})
    super(options).merge({
      image_url: image_url,
      thumb_url: thumb_url,
      small_url: small_url,
    })
  end
end
