class Wallet < ApplicationRecord
  belongs_to :family_member
  has_many :operations
  # has_many :operations, through: :family_member

  validates :name, presence: true
end
