# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    id { 1 }
    email { 'test@user.com' }
    username { 'test_username' }
    password { 'qwerty' }
  end
end
