require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Associations' do
    it { should have_many(:todo_users) }
    it { should have_many(:todos).through(:todo_users).dependent(:destroy) }
    it { should have_many(:devices).dependent(:destroy) }
  end

end
