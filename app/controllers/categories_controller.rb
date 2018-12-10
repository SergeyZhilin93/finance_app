class CategoriesController < ApplicationController
  before_action :set_category, only: %i[edit show update destroy]

  def index
    @category = Category.new
    @categories = Category.all
    @payments = Category.payments.order(:name).page(params[:payments_page])
    @incomes = Category.incomes.order(:name).page(params[:incomes_page])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        flash[:success] = t(:create)
        format.html { redirect_to categories_path }
      else
        flash.now[:error] = t(:error)
        format.html { render :new }
      end
    end
  end

  def update
    @category.assign_attributes(category_params)
    if @category.save
      flash[:success] = t(:update)
      redirect_to root_path
    else
      flash.now[:error] = t(:error)
      render :edit
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

  private

  def set_category
    @category = Category.find_by(id: params[:id])
    redirect_to root_path if @category.nil?
  end

  def category_params
    params.require(:category).permit(:name, :category_type)
  end
end
