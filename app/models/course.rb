class Course < ApplicationRecord
  validates_presence_of :title, :duration
end
