class CreatePsychics < ActiveRecord::Migration[6.0]
  def change
    create_table :psychics do |t|
      t.string :specialty
      t.string :localisation
      t.integer :hour_rate
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
