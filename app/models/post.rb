class Post < ApplicationRecord
  has_one_attached :post_image
  belongs_to :user
  has_many :cleaning_recipes, dependent: :destroy
  has_many :likes, dependent: :destroy
  accepts_nested_attributes_for :cleaning_recipes, allow_destroy: true
  
  def get_post_image
    unless post_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io:File.open(file_path),filename: 'no_image.jpg',content_type: 'image/jpeg')
    end
    post_image.variant(resize_to_limit:[width,height]).processed
  end
  
  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end
  
end
