class Book < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }
  validates :body, presence: true, length: { maximum: 150 }

  belongs_to :user

  has_one_attached :image

  def get_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_book_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
