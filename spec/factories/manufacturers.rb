# frozen_string_literal: false

# == Schema Information
#
# Table name: manufacturers
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_manufacturers_on_name  (name) UNIQUE
#
FactoryBot.define do
  factory :manufacturer do
    name { 'Apple' }
  end
end
