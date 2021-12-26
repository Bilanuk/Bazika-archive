class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :titles, foreign_key: :owner_id, dependent: :destroy
end
