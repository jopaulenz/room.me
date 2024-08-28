class CreateLivingPreferences < ActiveRecord::Migration[7.1]
  def change
    create_table :living_preferences do |t|
      t.references :preferable, null: false, polymorphic: true
      t.integer :cleanliness, null: false
      t.integer :gender, null: false
      t.integer :smoking, null: false
      t.integer :partying, null: false
      t.integer :age, null: false
      t.integer :furnished, null: false
      t.integer :dishwasher, null: false
      t.integer :washingmaschine, null: false
      t.integer :balcony, null: false
      t.integer :kitchen, null: false
      t.integer :bathtub, null: false
      t.string :aboutme
      t.string :interest
      t.timestamps
    end
  end
end
