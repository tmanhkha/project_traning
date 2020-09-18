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
class Model < ApplicationRecord
  belongs_to :manufacturer

  has_many :data_memory_models, dependent: :destroy
  has_many :data_memories, through: :data_memory_models

  validates :name, presence: true, uniqueness: { case_sensitive: true }, length: { maximum: 100 }
end
