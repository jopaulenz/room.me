class AddDataToHosts < ActiveRecord::Migration[7.1]
  def change
    add_column :hosts, :first_name, :string
    add_column :hosts, :last_name, :string
    add_column :hosts, :date_of_birth, :date
    add_column :hosts, :gender, :integer
    add_column :hosts, :pronouns, :string
    add_column :hosts, :email_address, :string
    add_column :hosts, :phone_number, :string
    add_column :hosts, :district, :string
    add_column :hosts, :rent, :integer
    add_column :hosts, :duration, :integer
    add_column :hosts, :entry_date, :date
    add_column :hosts, :registration, :integer
    add_column :hosts, :room_size, :integer
    add_column :hosts, :furnished, :integer
  end
end
