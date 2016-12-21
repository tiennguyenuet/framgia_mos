class Admin::RegistrationsController < Devise::RegistrationsController
  layout "admin"

  def edit
    super
  end

  def update
    super
  end

  private

  def after_update_path_for resource
    admin_root_path
  end
end
