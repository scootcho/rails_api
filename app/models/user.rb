class User < ActiveRecord::Base
  has_secure_password
  has_many :order
  belongs_to :company

  validates :company, presence: true

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
									uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 8 }, on: :create
end
