FactoryBot.define do
  factory :user do
    name { 'username' }
    email { 'email@origami.com' }
    password { 'password' }
  end
end
