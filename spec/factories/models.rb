# frozen_string_literal: false

FactoryBot.define do
  factory :model do
    name { 'Iphone X' }
    manufacturer_id { create(:manufacturer).id }
  end

  factory :model_with_data_memories, class: Model do
    name { 'Iphone X' }
    manufacturer_id { create(:manufacturer).id }

    after_create do |model|
      model.data_memories << create(:data_memory)
    end
  end
end
