class Album < ActiveRecord::Base
  has_many :photos
  validates :title, presence: true

  scope :with_photos, joins(:photos).group("albums.id")

  def cover
    photos.ordered_by_position.first
  end

  def to_s
    title
  end
end
