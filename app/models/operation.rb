class Operation < ApplicationRecord
  belongs_to :category
  belongs_to :family_member
  # belongs_to :wallet; through => :family_member
end
