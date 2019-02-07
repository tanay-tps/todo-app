class Doorkeeper::AccessTokenController < Doorkeeper::TokensController
  # Overriding create action
  # POST /oauth/token
  def revoke
    revoke_token if authorized?
    remove_device if params[:device_token]
    render json: {
      success: true,
      message: 'You are successfully logged out',
      data: {},
      meta: [],
      errors: []
    }
  end

  def remove_device
    device.destroy if device
  end

  private

  def device
    @device ||= Device.find_by(token: params[:device_token])
  end
end
