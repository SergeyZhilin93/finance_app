class Category < ApplicationRecord
  paginates_per 5

  has_many :transactions

  scope :payments, -> { where(category_type: 'payment') }
  scope :incomes, -> { where(category_type: 'income') }

end
