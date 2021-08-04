class Course < ApplicationRecord
  belongs_to :category_name
  validates_presence_of :title, :duration, :category_name_id
end
