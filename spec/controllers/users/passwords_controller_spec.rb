require 'rails_helper'
RSpec.describe Users::PasswordsController, type: :request do

  let(:user) { FactoryBot.create(:user) }
  
  describe 'User password /users/password' do
    describe 'Successful' do
      it "Create and return password token" do
        process(:post, "/users/password", params: { user: {email: user.email} })
        # expect(response.status).to eq 200
      end
    end
  end

end