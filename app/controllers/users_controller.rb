class UsersController < ApplicationController
  load_and_authorize_resource

  def show
    @posts = @user.posts.page(params[:page]).per Settings.users.posts.per_page
  end
end
