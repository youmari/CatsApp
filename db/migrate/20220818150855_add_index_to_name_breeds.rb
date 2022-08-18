class AddIndexToNameBreeds < ActiveRecord::Migration[7.0]
  def change
    add_index :breeds, :name
  end
end
