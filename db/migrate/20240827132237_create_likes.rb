class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :likes do |t|
      t.references :liked, polymorphic: true, null: false
      t.references :liker, polymorphic: true, null: false

      t.timestamps
    end
  end
end
