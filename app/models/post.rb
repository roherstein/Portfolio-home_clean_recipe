class Post < ApplicationRecord
  has_one_attached :post_image
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 20 }
  validates :introduction, length: { maximum: 200 }, on: :publisize
  validates :cleaning_recipes, presence: true, on: :publisize
  
  has_many :cleaning_recipes, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :cleaning_tools, dependent: :destroy
  has_many :post_categories , dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :categories, :through => :post_categories
  accepts_nested_attributes_for :cleaning_tools, allow_destroy: true
  accepts_nested_attributes_for :cleaning_recipes, allow_destroy: true
  accepts_nested_attributes_for :post_categories, allow_destroy: true
  
  def get_post_image(width,height)
    unless post_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      post_image.attach(io:File.open(file_path),filename: 'no_image.jpg',content_type: 'image/jpeg')
    end
    post_image.variant(resize_to_limit:[width,height]).processed
  end
  
  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end
  
  def self.looks(keyword)
    @post = Post.where("title LIKE?","%#{keyword}%")
  end
  

end
