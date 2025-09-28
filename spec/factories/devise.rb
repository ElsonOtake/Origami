FactoryBot.define do
  factory :customer do
    name { 'username' }
    email { 'email@origami.com' }
    password { 'password' }
  end
end
