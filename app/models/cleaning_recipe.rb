class CleaningRecipe < ApplicationRecord
  has_one_attached :recipe_image
  belongs_to :post
  validates :cleaning_recipe, presence: true, length: { maximum: 140 }
  
  def get_recipe_image(width, height)
    unless recipe_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      recipe_image.attach(io:File.open(file_path),filename: 'no_image.jpg',content_type: 'image/jpeg')
    end
    recipe_image.variant(resize_to_limit:[width,height]).processed
  end
end
