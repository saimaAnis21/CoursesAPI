class Course < ApplicationRecord
  belongs_to :user, foreign_key: 'created_by'

  validates_presence_of :title, :duration, :category_name_id
  validates :title, length: { minimum: 3 }
  validates :duration, format: { with: /\A\d+(?:\.\d{1})?\z/ }, numericality: { greater_than: 0, less_than: 10 }
end
