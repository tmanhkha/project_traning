class AddIndexToDataMemories < ActiveRecord::Migration[6.0]
  def change
    add_index :data_memories, :name, unique: true
  end
end
