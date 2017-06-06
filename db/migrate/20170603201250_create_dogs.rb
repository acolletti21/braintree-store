class CreateDogs < ActiveRecord::Migration[5.0]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :quote
      t.integer :price

      t.timestamps
    end
  end
end
