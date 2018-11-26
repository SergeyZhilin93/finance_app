class CategoryController < ApplicationController
  before_action :set_category, only: [:update, :destroy ]

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
  end

  def settings
    render 'categories/settings', locals: { payments: Category.payments, incomes: Category.incomes }
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
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :category_type)
  end

end
