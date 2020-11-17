class ChangeColumnAccessories < ActiveRecord::Migration[6.0]
  def change
    remove_column :accessories, :psychic_id
    add_reference :accessories, :psychic, foreign_key: true
  end
end
