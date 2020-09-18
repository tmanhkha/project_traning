class CreateDataMemoryModels < ActiveRecord::Migration[6.0]
  def change
    create_table :data_memory_models do |t|
      t.references :data_memory, null: false, foreign_key: true
      t.references :model, null: false, foreign_key: true

      t.timestamps
    end
  end
end
