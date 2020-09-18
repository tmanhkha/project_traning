# frozen_string_literal: false

# == Schema Information
#
# Table name: roles
#
#  id         :bigint           not null, primary key
#  level      :integer
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
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
