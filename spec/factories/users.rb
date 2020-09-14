FactoryBot.define do
  factory :user do
    username { 'MyString' }
    uid { 'MyString' }
    access_token { 'MyString' }
    email { 'MyString' }
    role { 'student' }
    about_me { 'yay!!!' }
  end
end
