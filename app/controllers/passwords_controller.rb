class PasswordsController < Devise::PasswordsController
  prepend_before_action :require_no_authentication
  append_before_action :assert_reset_token_passed, only: :edit

  def new
    super
  end

  def create
    super
  end

  def edit
    super
  end

  def update
    super
  end

  protected
  def after_resetting_password_path_for resource
    super
  end

  def after_sending_reset_password_instructions_path_for resource_name
    root_path if is_navigational_format?
  end

  def assert_reset_token_passed
    super
  end

  def unlockable? resource
    super
  end

  def translation_scope
    super
  end
end
