class Transaction < ApplicationRecord

  belongs_to :category

  validates :amount, presence: true, length: { maximum: 8 }

end
