class CreateCats < ActiveRecord::Migration[7.0]
  def change
    create_table :cats, id: false, primary_key: :id do |t|
      t.string :id, null: false
      t.string :url, null: false
      t.integer :width
      t.integer :height

      t.timestamps
      t.index :id, unique: true
    end
  end
end
