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
class DataMemory < ApplicationRecord
  has_many :data_memory_models, dependent: :destroy
  has_many :models, through: :data_memory_models

  validates :size, presence: true,
                   uniqueness: { case_sensitive: true },
                   numericality: { less_than: 1000 }
end
