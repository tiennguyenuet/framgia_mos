class Admin::CategoriesController < ApplicationController
  layout "admin"
  load_and_authorize_resource

  def index
    @new_category = Category.new
  end

  def create
    if @category.save
      flash[:success] = t ".success"
      redirect_to admin_categories_url
    else
      @new_category = @category
      @categories = Category.all
      render :index
    end
  end

  private
  def category_params
    params.require(:category).permit :name, :description, :parent_id
  end
end
