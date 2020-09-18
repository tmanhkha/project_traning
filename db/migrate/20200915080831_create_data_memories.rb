class CreateDataMemories < ActiveRecord::Migration[6.0]
  def change
    create_table :data_memories do |t|
      t.integer :name

      t.timestamps
    end
  end
end
