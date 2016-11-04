class Admin::BaseController < ApplicationController
  layout "admin"

  before_action :check_admin_logged_in

  private
  def check_admin_logged_in
    redirect_to new_admin_user_session_path unless admin_user_signed_in?
  end
end
