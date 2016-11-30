class RegistrationsController < Devise::RegistrationsController

  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
        sign_up(resource_name, resource)
        render json: {}
    else
      clean_up_passwords resource
      set_minimum_password_length
      render json: {errors: resource.errors.full_messages}, status: 422
    end
  end
end
