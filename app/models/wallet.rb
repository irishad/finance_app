class Wallet < ApplicationRecord
    belongs_to :family_member
    # has_many :operations; through => :family_member
end
