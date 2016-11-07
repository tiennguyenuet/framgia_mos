class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :load_all_categories, only: :new

  def new
  end

  def create
    if @post.save
      flash[:success] = t ".success"
      redirect_to root_url
    else
      load_all_categories
      render :new
    end
  end

  def show
  end

  private
  def load_all_categories
    @nested_categories = Category.all_categories @category_roots
  end

  def post_params
    params.require(:post).permit :id, :title, :description, :category_id,
      :content, :image, :audio, :user_id, :post_type, :status
  end
end
