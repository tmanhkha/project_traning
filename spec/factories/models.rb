# frozen_string_literal: false

# == Schema Information
#
# Table name: models
#
#  id              :bigint           not null, primary key
#  name            :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  manufacturer_id :bigint           not null
#
# Indexes
#
#  index_models_on_manufacturer_id  (manufacturer_id)
#  index_models_on_name             (name) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (manufacturer_id => manufacturers.id)
#
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
