FactoryGirl.define do
  factory :user do
    email 'some@email.com'
    password 'somepassword'
    password_confirmation 'somepassword'
  end
end
