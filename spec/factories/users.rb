FactoryBot.define do
  factory :user do
    username { "someUsername" }
    email { "someUsername@gmail.com" }
    password { "somePassword" }
    first_name { "Some" }
    last_name { "One" }
  end
end
