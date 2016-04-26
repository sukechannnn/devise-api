FactoryGirl.define do
  factory :user do
    email1 'example@gmail.com'
    passwd 'password'
    uid 1
    nname 'yosuke'
    remember_me 0
  end
end
