FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "uploada #{n}" }
    sequence(:email) { |n| "uploada_#{n}@bunkersofa.com" }
    password 'aaaaaa'
    password_confirmation 'aaaaaa'
  
    factory :admin do
      admin true
    end
  end
end

=begin
FactoryGirl.define do
  factory :user_old do
    name "uploada"
    email "uploada@bunkersofa.com"
    password 'aaaaaa'
    password_confirmation 'aaaaaa'
  end
end
=end
