class CleaningTool < ApplicationRecord
  belongs_to :post
  validates :cleaning_tool_name, presence: true, length: { minimum: 1 }
end
