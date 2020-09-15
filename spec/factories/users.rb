# frozen_string_literal: false

FactoryBot.define do
  factory :user do
    email { "#{Random.rand(100_000)}@factory.com" }
    password { '123456789' }
    password_confirmation(&:password)

    trait :admin do
      association :role, factory: :admin_role
    end

    trait :manager do
      association :role, factory: :manager_role
    end

    trait :guest do
      association :role, factory: :guest_role
    end
  end

  factory :invalid_user, class: User do
    email { '' }
    password { '' }
    password_confirmation(&:password)
  end
end
