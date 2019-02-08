module ControllerSpecHelper
  def token_generator
    user = User.create!(email: 'test@gmail.com', password: '123456', password_confirmation: '123456')
    user.todos.create(title: 'Test', description: 'Test description', user_id: user.id)
    application = Doorkeeper::Application.create!(name: 'test', uid: '101', redirect_uri: "https://localhost:3000")
    token = Doorkeeper::AccessToken.create!(resource_owner_id: user.id, application_id: application.id)
    return token.token
  end
end