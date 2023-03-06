class Wallet < ApplicationRecord
    has_many :operations

    validates :name, presence: true, uniqueness: true

    paginates_per 10
end
