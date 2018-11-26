class Category < ApplicationRecord
  has_many :transactions

  scope :payments, -> { where(category_type: 'payment') }
  scope :incomes, -> { where(category_type: 'income') }

end
