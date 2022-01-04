class Title < ApplicationRecord
    belongs_to :user, foreign_key: :owner_id

    enum status: [:watching, :planning, :watched]

    validates :api_id, presence: :true, uniqueness: { scope: :owner_id }
end
