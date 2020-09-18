# frozen_string_literal: false

# == Schema Information
#
# Table name: data_memories
#
#  id         :bigint           not null, primary key
#  size       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_data_memories_on_size  (size) UNIQUE
#
require 'rails_helper'

RSpec.describe DataMemory, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:data_memory_models).dependent(:destroy) }
    it { is_expected.to have_many(:models).through(:data_memory_models) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:size) }
    it { is_expected.to validate_uniqueness_of(:size) }
  end
end
