class User < ApplicationRecord
  # encrypt password
  # this adds methods to authenticate against a bcrypt password.
  # This mechanism requires us to have a password_digest attribute in user table
  has_secure_password

  has_many :courses, dependent: :destroy, foreign_key: :created_by
  validates_presence_of :email, :password_digest
  validates :name, presence: true, length: { minimum: 5 }
  validates_uniqueness_of :email, on: :create, message: 'This email already exists!'
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
