class LikesController < ApplicationController

  def create
    case params[:commit]
    when "post"
      post = Post.find(params[:id])
      like = post.likes.where(user_id: current_user.id).first
      if like
        like.destroy
        respond_to do |format|
          format.json {render json: {size: post.likes.size, type: :unlike}}
          format.html {redirect_to post}
        end
      else
        post.likes.create user_id: current_user.id
        respond_to do |format|
          format.json {render json: {size: post.likes.size, type: :like}}
          format.html {redirect_to post}
        end
      end
    end
  end
end
