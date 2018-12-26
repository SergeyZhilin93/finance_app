class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[edit show update destroy]
  before_action :set_transactions, only: %i[create]
  before_action :set_category, only: %i[create]

  def payments
    @payment_categories = Category.payments
    @transactions = Transaction.payments.order(created_at: :desc).limit(10)
    @transaction = Transaction.new
  end

  def incomes
    @income_categories = Category.incomes
    @transactions = Transaction.incomes.order(created_at: :desc).limit(10)
    @transaction = Transaction.new
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = @category.transactions.build(transaction_params)
    @transactions = @transactions.order(created_at: :desc).limit(10)
    respond_to do |format|
      if @transaction.save
        flash[:success] = t(:create)
        format.js {}
      else
        flash[:error] = @transaction.errors.full_messages.join(', ')
        format.js { render 'layouts/flash' }
      end
    end
  end

  private

  def set_transactions
    transaction_type = set_category.category_type
    @transactions = transaction_type == 'income' ? Transaction.incomes : Transaction.payments
    @transactions

  end

  def set_transaction
    @transaction = Transaction.find_by(id: params[:id])
    redirect_to transactions_path if @transaction.nil?
  end

  def transaction_params
    params.require(:transaction).permit(:name, :amount)
  end

  def set_category
    @category = Category.find_by(id: params[:transaction][:category_id])
  end

end
