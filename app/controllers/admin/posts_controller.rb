class Admin::PostsController < Admin::BaseController
  load_and_authorize_resource

  def index
    @search = Post.all.ransack params[:q]
    @categories_for_select = Category.pluck(:name, :id)
    @users_for_select = User.pluck(:name, :id)
    @posts = @search.result.order(created_at: :desc).page(params[:page])
      .per Settings.admin.posts.per_page
  end
end
