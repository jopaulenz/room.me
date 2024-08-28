class CreateFlatmates < ActiveRecord::Migration[7.1]
  def change
    create_table :flatmates do |t|
      t.references :user, null: false, foreign_key: true
      t.string :city

      t.timestamps
    end
  end
end
