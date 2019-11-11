FactoryBot.define do
  factory :user do
    id {}
    name  { "hoge" }
    email  { "hoge@hoge.com" }
    address  { "fugafuga" }
    password {'password'}
    password_confirmation {'password'}
   


  end
end
