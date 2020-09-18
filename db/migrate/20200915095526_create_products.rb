class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :user, null: false, foreign_key: true
      t.references :data_memory_model, null: false, foreign_key: true
      t.decimal :price

      t.timestamps
    end
  end
end
