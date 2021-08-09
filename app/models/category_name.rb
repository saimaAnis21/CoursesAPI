class CategoryName < ApplicationRecord
  has_many :courses, foreign_key: :category_name_id

  validates_presence_of :name
end
