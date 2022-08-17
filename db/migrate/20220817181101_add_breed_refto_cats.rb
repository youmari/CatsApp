class AddBreedReftoCats < ActiveRecord::Migration[7.0]
  def change
    add_reference :cats, :breed, type: :string, foreign_key: true
  end
end
