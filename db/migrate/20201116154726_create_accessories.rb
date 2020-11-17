class CreateAccessories < ActiveRecord::Migration[6.0]
  def change
    create_table :accessories do |t|
      t.string :name
      t.integer :price
      t.references :psychic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
