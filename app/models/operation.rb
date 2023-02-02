class Operation < ApplicationRecord
  belongs_to :category
  belongs_to :family_member
  belongs_to :wallet

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :odate, presence: true
  validates :description, presence: true

  enum otype: {
    income: 10,
    expense: 20,
    transfer: 30
  }
end
