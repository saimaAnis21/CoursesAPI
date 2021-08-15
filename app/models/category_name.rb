class CategoryName < ApplicationRecord
  has_many :courses, foreign_key: :category_name_id

  scope :with_courses, lambda{
    joins(:courses)
    .select('courses.id', 'courses.title', 'courses.created_by',
      'courses.duration', 'category_names.name AS category')
  }
  
  validates_presence_of :name
end
