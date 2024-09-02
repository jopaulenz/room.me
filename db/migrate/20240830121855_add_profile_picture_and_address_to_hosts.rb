class AddProfilePictureAndAddressToHosts < ActiveRecord::Migration[7.1]
  def change
    # Entferne Dopplung für die Stadt
    # add_column :hosts, :city, :string # Bereits in einer anderen Migration hinzugefügt

    # Bilder und Adresse
    add_column :hosts, :profile_picture_url, :string
    add_column :hosts, :apartment_picture_urls, :text, array: true, default: []
    add_column :hosts, :address, :string

    # Details zur Adresse
    add_column :hosts, :street, :string
    add_column :hosts, :postcode, :string
    add_column :hosts, :country, :string
  end
end
