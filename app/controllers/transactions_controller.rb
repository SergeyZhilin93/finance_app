class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[edit show update destroy]
  before_action :set_limit, only: %i[index create]

  def index
    @payment_categories = Category.payments
    @transaction = Transaction.new
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        flash[:success] = t(:create)
        format.html { redirect_to transactions_path }
        format.js { }
      else
        flash[:error] = @transaction.errors.full_messages.join(', ')
        format.html { redirect_to transactions_path }
        format.js { render 'layouts/flash' }
      end
    end
  end

  def show
  end

  private

  def set_limit
    @transactions = Transaction.order(created_at: :desc).limit(10)
  end

  def set_transaction
    @transaction = Transaction.find_by(id: params[:id])
    redirect_to transactions_path if @transaction.nil?
  end

  def transaction_params
    params.require(:transaction).permit(:name, :category_id, :amount)
  end

end
