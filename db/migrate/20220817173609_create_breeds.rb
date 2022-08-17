class CreateBreeds < ActiveRecord::Migration[7.0]
  def change
    create_table :breeds, id: false, primary_key: :id do |t|
      t.string :id, null: false
      t.string :name
      t.string :origin

      t.timestamps
      t.index :id, unique: true
    end
  end
end
