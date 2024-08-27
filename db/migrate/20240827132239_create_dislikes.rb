class CreateDislikes < ActiveRecord::Migration[7.1]
  def change
    create_table :dislikes do |t|
      t.references :disliked, polymorphic: true, null: false
      t.references :disliker, polymorphic: true, null: false

      t.timestamps
    end
  end
end
