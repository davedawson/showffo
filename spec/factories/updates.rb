# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :update do
    content "MyString"
    user_id 1
    challenge_id 1
  end
end
