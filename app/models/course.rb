class Course < ApplicationRecord
  belongs_to :user, foreign_key: 'created_by'
  validates_presence_of :title, :duration, :category_name_id
end
