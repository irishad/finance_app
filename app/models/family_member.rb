class FamilyMember < ApplicationRecord
    has_many :wallets

    validates :name, presence: true, allow_blank: false
end
