# frozen_string_literal: false

FactoryBot.define do
  factory :role do
    name { 'role' }
    level { 1 }
  end

  factory :admin_role, class: Role do
    name { 'Admin' }
    level { 1 }
  end

  factory :manager_role, class: Role do
    name { 'Manager' }
    level { 2 }
  end

  factory :guest_role, class: Role do
    name { 'Guest' }
    level { 3 }
  end
end
