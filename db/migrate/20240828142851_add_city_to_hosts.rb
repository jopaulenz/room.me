class AddCityToHosts < ActiveRecord::Migration[7.1]
  def change
    add_column :hosts, :city, :string
  end
end
