class AddIndexToTables < ActiveRecord::Migration[6.0]
  def change
    add_index :models, :name, unique: true
    add_index :manufacturers, :name, unique: true
  end
end
