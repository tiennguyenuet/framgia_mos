class SessionsController < Devise::SessionsController
  def new
    super
  end

  def create
    user = User.find_by_email(params[:user][:email])
    if user && user.valid_password?(params[:user][:password])
      self.resource = warden.authenticate!({scope: resource_name})
      sign_in(resource_name, resource)
      yield resource if block_given?
      render json: {success: true}
    else
      render json: {message: t(".error")}, status: 422
    end
  end

  def destroy
    super
  end
end
