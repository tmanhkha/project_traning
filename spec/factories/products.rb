# frozen_string_literal: false

FactoryBot.define do
  factory :product do
    user { nil }
    data_memory_model { nil }
    price { '9.99' }
  end
end
