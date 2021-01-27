FactoryBot.define do
  factory :user do
    email { "sim@email.com" }
    password { '123456' }
    nickname { 'sim' }
    category { 'Financial' }

  end
end
