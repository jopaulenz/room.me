class AddProfilePictureUrlToFlatmates < ActiveRecord::Migration[7.1]
  def change
    add_column :flatmates, :profile_picture_url, :string
  end
end
