require 'rails_helper'

RSpec.describe Todo, type: :model do

  describe 'Associations' do
    it { should have_many(:todo_users).dependent(:destroy) }
    it { should have_many(:users).through(:todo_users) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:title) }
  end
end
