class AddCoordinatesToHosts < ActiveRecord::Migration[7.1]
  def change
    add_column :hosts, :latitude, :float
    add_column :hosts, :longitude, :float
  end
end
