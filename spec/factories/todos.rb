FactoryBot.define do
  factory :todo do
    title "Todo title"
    description "Todo test description"
    user_id 1
    after(:create) do |job|
      job.users << FactoryBot.create(:user)
    end
  end
end
