FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "uploada #{n}" }
    sequence(:email) { |n| "uploada_#{n}@bunkersofa1.com" }
    password 'aaaaaa'
    password_confirmation 'aaaaaa'
  
    factory :admin do
      admin true
    end
  end

 
  factory :micropost do
    content "Lorem ipsum"
    user
  end

end

