class Icon < ApplicationRecord
  has_one_attached :icon_image

  attribute :content, :string, default: 'suru-blue.png'

  before_create :default_image
  def default_image
    if !self.icon_image.attached?
      self.icon_image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'suke_surume.png')), filename: 'suke_surume.png', content_type: 'image/png')
    end
  end
end
