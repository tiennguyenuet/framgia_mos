class Admin::CategoriesController < Admin::BaseController
  load_and_authorize_resource
  before_action :load_parent_categories, only: [:index, :show]

  def index
    @new_category = Category.new
    load_categories
  end

  def create
    if @category.save
      flash[:success] = t ".success"
      redirect_to admin_categories_url
    else
      @new_category = @category
      load_categories
      load_parent_categories
      render :index
    end
  end

  def show
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = t ".success"
      redirect_to [:admin, @category]
    else
      load_parent_categories
      render :show
    end
  end

  def destroy
    ids = params[:category_ids].nil? ? params[:id] : params[:category_ids]
    if ids.nil?
      flash[:danger] = t ".must_select"
    else
      @categories = Category.find ids
      if Category.destroy @categories
        flash[:success] = t ".success"
      else
        flash[:danger] = t ".fail"
      end
    end
    redirect_to admin_categories_path
  end

  private
  def load_categories
    @search = Category.ransack params[:q]
    @categories = @search.result.includes(:parent, :childrens, :posts)
      .page(params[:page]).per Settings.admin.categories.per_page
  end

  def load_parent_categories
    case action_name
    when "index" || "create"
      @parent_categories = Category.all_categories @categories_parent_master
    when "show" || "update"
      @parent_categories = Category.all_categories_except @category, @categories_parent_master
    end
  end

  def category_params
    params.require(:category).permit :name, :description, :parent_id
  end
end
