class Admin::PostsController < Admin::BaseController
  load_and_authorize_resource

  def index
    @search = Post.all.ransack params[:q]
    @categories_for_select = Category.pluck(:name, :id)
    @users_for_select = User.pluck(:name, :id)
    @posts = @search.result.order(created_at: :desc).page(params[:page])
      .per Settings.admin.posts.per_page
    @post = Post.new
    @categories = Category.all
  end

  def show
  end

  def create
    @post = Post.new post_params
    if @post.save
      flash[:success] = t ".success"
      redirect_to admin_posts_path
    else
      flash[:danger] = t ".fail"
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:id, :title, :description, :category_id,
      :content, :image, :audio, :user_id, :post_type, :status)
  end
end
