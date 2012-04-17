class Photo < ActiveRecord::Base
  mount_uploader :image, PhotoUploader

  belongs_to :album

  scope :ordered_by_position, order(:position)

  validates :image, :album_id, presence: true

  def self.sort(photos)
    photos.each_with_index do |id, index|
      Photo.update_all({ position: index+1 }, { id: id })
    end
  end

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
