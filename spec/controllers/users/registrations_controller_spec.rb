require 'rails_helper'
RSpec.describe Users::RegistrationsController, type: :request do

  describe 'User /users' do
    describe 'Successful' do
      it "Create and return user" do
        process(:post, "/users", params: { user: {email: "test@gmail.com", password: "123456", password_confirmation: '123456'} })
        expect(response.status).to eq 200
      end
    end

    describe 'Unsuccessful' do
      it "Do not create user validation vailed" do
        process(:post, "/users", params: { user: {email: "", password: "123456", password_confirmation: '123456'} })
        expect(response.status).to eq 422
      end
    end

    describe 'Unsuccessful' do
      it "Do not create user validation vailed" do
        process(:post, "/users", params: { user: {email: "test@gmail.com", password: "12345", password_confirmation: '123456'} })
        expect(response.status).to eq 422
      end
    end
  end

end