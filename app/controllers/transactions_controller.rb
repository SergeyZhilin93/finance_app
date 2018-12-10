class TransactionsController < ApplicationController

  def index
    @transactions = Transaction.all
  end

  def new
    @transaction = Transaction.new
  end

  def payments
    @payment_categories = Category.payments
    render 'categories/payments'
  end

end
