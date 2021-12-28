class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, length: { in: 4..15 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  has_many :titles, foreign_key: :owner_id, dependent: :destroy
end
