# frozen_string_literal: false

# == Schema Information
#
# Table name: data_memory_models
#
#  id             :bigint           not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  data_memory_id :bigint           not null
#  model_id       :bigint           not null
#
# Indexes
#
#  index_data_memory_models_on_data_memory_id  (data_memory_id)
#  index_data_memory_models_on_model_id        (model_id)
#
# Foreign Keys
#
#  fk_rails_...  (data_memory_id => data_memories.id)
#  fk_rails_...  (model_id => models.id)
#
require 'rails_helper'

RSpec.describe DataMemoryModel, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:data_memory) }
    it { is_expected.to belong_to(:model) }
  end
end
