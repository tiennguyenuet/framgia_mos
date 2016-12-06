class Admin::AcceptPostController < Admin::BaseController
  def update
    post = Post.find params[:id]

    case params[:commit]
    when Settings.admin.posts.accept
      if post.update_attributes status: :accepted,
        accepted_by: params[:accepted_by]
        NotificationBroadcastJob.perform_now post
        flash[:success] = t ".accepted"
      end
    when Settings.admin.posts.reject
      if post.update_attributes status: :rejected,
        accepted_by: params[:accepted_by]
        flash[:info] = t ".rejected"
      end
    end

    redirect_to [:admin, post]
  end
end
