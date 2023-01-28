class Operation < ApplicationRecord
  belongs_to :category
  belongs_to :family_member
  has_one :wallet, through: :family_member

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :odate, presence: true
  validates :description, presence: true
end
