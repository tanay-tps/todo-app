class UpdateDevice
  attr_accessor :current_resource_owner

  def initialize(current_resource_owner)
    @current_resource_owner = current_resource_owner
  end

  def call
    update_device
  end

  def update_device
    current_resource_owner.devices.create(token: generate_device_token, platform: [:android, :ios].sample)
  end

  def generate_device_token
    o = [('a'..'z'), ('A'..'Z'), (0..9)].map(&:to_a).flatten
    string = (0...50).map { o[rand(o.length)] }.join
  end
end