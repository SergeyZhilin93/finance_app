class CategoryController < ApplicationController
  before_action :set_category, only: [:update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

    def create
      @category = Category.new(category_params)

      respond_to do |format|
        if @category.save
          format.html { redirect_to root_path }
        else
          format.html { render :new }
        end
      end
    end

  def edit
  end

  def update
    @category.update_attributes(category_params)
    @category.save
    redirect_to root_path
  end

  def settings
    @payments = Category.payments.order(:name).page(params[:payments_page])
    @incomes = Category.incomes.order(:name).page(params[:incomes_page])
    @category = Category.new()
    render 'categories/settings'
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
  end

  def category_params
    params.require(:category).permit(:name, :category_type)
  end

end
