class Category < ApplicationRecord
  has_many :post_categories , dependent: :destroy
  has_many :posts, :through => :post_categories
  validates :category_name, uniqueness: true
end
