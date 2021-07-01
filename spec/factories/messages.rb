FactoryBot.define do
  factory :message do
    message { "Some message by someone here" }
    user { nil }
  end
end
