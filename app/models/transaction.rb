class Transaction < ApplicationRecord

  belongs_to :category

  validates :amount, presence: true, length: { maximum: 8 }

  scope :payments, -> { includes(:category).where(categories: { category_type: 'payment' }) }
  scope :incomes, -> { includes(:category).where(categories: { category_type: 'income' }) }

end
