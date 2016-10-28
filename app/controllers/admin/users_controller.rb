class Admin::UsersController < Admin::BaseController
  load_and_authorize_resource

  def index
    @search = User.all.ransack params[:q]
    @users = @search.result.order(:name).page(params[:page])
      .per Settings.admin.users.per_page
  end

  def update
    if @user.update_attributes user_params
      flash[:success]= t ".success"
      redirect_to admin_users_url
    else
      flash[:danger]= t ".error"
      redirect_to admin_users_url
    end
  end

  private
  def user_params
    params.require(:user).permit :id, :status
  end
end
