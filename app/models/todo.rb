class Todo < ApplicationRecord


  has_many :todo_users, dependent: :destroy
  has_many :users, through: :todo_users

  validates :title, presence: true

  def send_notification
    message = 'Todo updated please check.'
    device_ids = Device.where(user_id: (self.users.ids << self.user_id).uniq).pluck(:token)
    FirebaseCloudMessaging::UserNotificationSender.new(device_ids, message).call
  end

end
