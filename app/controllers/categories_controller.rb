class CategoriesController < ApplicationController
  load_resource

  def show
    @posts = @category.all_posts.page(params[:page])
      .per Settings.categories.posts.per_page
  end
end
