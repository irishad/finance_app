class Operation < ApplicationRecord
  belongs_to :category
  belongs_to :family_member
  has_one :wallet, through: :family_member
end
