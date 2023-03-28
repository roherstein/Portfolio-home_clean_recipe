class CleaningTool < ApplicationRecord
  belongs_to :post
  validates :cleaning_tool_name, presence: true, length: { maximum: 30 }

end
