class User < ApplicationRecord
  # encrypt password
  # this adds methods to authenticate against a bcrypt password.
  # This mechanism requires us to have a password_digest attribute in user table
  has_secure_password

  has_many :courses, dependent: :destroy, foreign_key: :created_by
  validates_presence_of :name, :email, :password_digest
end
