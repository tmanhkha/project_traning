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
FactoryBot.define do
  factory :data_memory do
    size { 1 }
  end
end
