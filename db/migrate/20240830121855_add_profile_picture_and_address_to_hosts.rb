class AddProfilePictureAndAddressToHosts < ActiveRecord::Migration[7.1]
  def change
    add_column :hosts, :profile_picture_url, :string
    add_column :hosts, :apartment_picture_urls, :text
    add_column :hosts, :address, :string
  end
end
