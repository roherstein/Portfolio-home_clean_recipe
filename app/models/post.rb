class Post < ApplicationRecord
  has_one_attached :post_image
  belongs_to :user
  has_many :cleaning_recipes, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :cleaning_tools, dependent: :destroy
  has_many :post_categories , dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :categories, :through => :post_categories
  
  accepts_nested_attributes_for :cleaning_tools, allow_destroy: true
  accepts_nested_attributes_for :cleaning_recipes, allow_destroy: true
  accepts_nested_attributes_for :post_categories, allow_destroy: true
  
  validates :title, presence: true, length: { maximum: 20 }
  validates :introduction, presence: true, length: { maximum: 200 }
  validate :validates_cleaning_tools
  validate :validates_cleaning_recipes
  
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
  
  private
  
  def validates_cleaning_tools
    cleaning_tools.each do |cleaning_tool|
      if cleaning_tool.invalid?
        cleaning_tool.errors.full_messages.each do |msg|
          errors.add(:base, msg)
        end
      end
    end
  end
  
  def validates_cleaning_recipes
    cleaning_recipes.each do |cleaning_recipe|
      if cleaning_recipe.invalid?
        cleaning_recipe.errors.full_messages.each do |msg|
          errors.add(:base, msg)
        end
      end
    end
  end
end
