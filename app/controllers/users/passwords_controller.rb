# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  skip_before_action :doorkeeper_authorize!
  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  def create
    self.resource = User.find_by_email(resource_params[:email])
    if resource.present?
      token = resource.send_reset_password_instructions
      yield resource if block_given?
      if successfully_sent?(resource)
         render json: { success: "true", message: "Reset token sent to email: #{resource_params[:email]}", data: {token: token} }, status: 200
      else
        render json: { success: "false", error: resource&.errors&.full_messages, status: 422 }
      end
    else
      render json: { success: false, message: "You are not registered with this email address" }, status: 404
    end
  end
  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  def update
    self.resource = resource_class.reset_password_by_token(resource_params)
    yield resource if block_given?
    if resource.errors.empty?
      resource.unlock_access! if unlockable?(resource)
      render json: { success: "true", message: "Your password created successfully", data: {user: resource} }, status: 200
    else
      set_minimum_password_length
      render json: { success: "false", error: resource&.errors&.full_messages, status: 422 }
    end
  end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
