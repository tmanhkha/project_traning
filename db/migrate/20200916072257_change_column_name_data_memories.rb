class ChangeColumnNameDataMemories < ActiveRecord::Migration[6.0]
  def change
    rename_column :data_memories, :name, :size
  end
end
