require 'rails_helper'

RSpec.describe FirebaseCloudMessaging::UserNotificationSender, type: :service do
  
  let(:user) { FactoryBot.create(:user) }
  let(:devices) { FactoryBot.create_list(:device, 3,user_id: user.id) }
  let!(:todo) { FactoryBot.create_list(:todo, 3) }



  describe "#initialize" do
    it "should initialize params" do
      expect(described_class.new(user.devices.ids, 'Todo updated')).to be_present
    end
  end

end