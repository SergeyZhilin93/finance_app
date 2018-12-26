class Category < ApplicationRecord
  paginates_per 5

  validates :name, presence: true

  has_many :transactions, dependent: :destroy

  scope :payments, -> { where(category_type: 'payment') }
  scope :incomes, -> { where(category_type: 'income') }

end
