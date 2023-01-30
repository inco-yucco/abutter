class Photo < ApplicationRecord
  belongs_to :user

  has_many :comments
  has_many :likes
  has_many :bookmarks
  
  has_one_attached :image

  before_create :default_image

  def default_image
    if !self.image.attached?
      self.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'ikaline.png')), filename: 'ikaline.png', content_type: 'image/png')
    end
  end

end
