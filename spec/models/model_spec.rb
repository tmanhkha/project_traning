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
require 'rails_helper'

RSpec.describe Model, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:manufacturer) }
    it { is_expected.to have_many(:data_memory_models).dependent(:destroy) }
    it { is_expected.to have_many(:data_memories).through(:data_memory_models) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    subject { create(:manufacturer) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
