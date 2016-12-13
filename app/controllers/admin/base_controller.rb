class Admin::BaseController < ApplicationController
  layout "admin"

  before_action :check_admin_logged_in

  private

  def check_admin_logged_in
    redirect_to new_admin_user_session_path unless admin_user_signed_in?
  end

  def current_ability
    controller_name_segments = params[:controller].split("/")
    controller_name_segments.pop
    controller_namespace = controller_name_segments.join("/").camelize
    Ability.new(current_admin_user, controller_namespace)
  end
end
