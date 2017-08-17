class User < ActiveRecord::Base
  has_secure_password

  validates :password, presence: { on: :create}, length: { minimum: 2, allow_blank: true }

  validates :name, :email, presence: true, length: { minimum: 2 }

  validates :email, uniqueness: true

  before_save { |user| user.email = user.email.downcase }

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates_presence_of :password_confirmation, if: :password_digest_changed?

  has_many :secrets
  has_many :likes, dependent: :destroy
  has_many :secrets_liked, through: :likes, source: :secret

end
