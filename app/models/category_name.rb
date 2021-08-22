class CategoryName < ApplicationRecord
  has_many :courses, foreign_key: :category_name_id

  scope :with_courses, lambda {
    joins(:courses)
      .select('courses.id', 'courses.title', 'courses.created_by',
              'courses.duration', 'category_names.name AS category')
  }

  scope :with_courses_ofuserid, lambda { |userid|
    with_courses.where(
      'courses.created_by = ?', userid
    )
  }

  scope :with_courses_ofcourseid, lambda { |courseid|
    with_courses.where(
      'courses.id = ?', courseid
    )
  }

  validates_presence_of :name
end
