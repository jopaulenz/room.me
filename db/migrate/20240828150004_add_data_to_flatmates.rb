class AddDataToFlatmates < ActiveRecord::Migration[7.1]
  def change
    add_column :flatmates, :first_name, :string
    add_column :flatmates, :last_name, :string
    add_column :flatmates, :date_of_birth, :date
    add_column :flatmates, :gender, :integer
    add_column :flatmates, :pronouns, :string
    add_column :flatmates, :email_address, :string
    add_column :flatmates, :phone_number, :string
    add_column :flatmates, :district, :string
    add_column :flatmates, :rent_range_min, :integer
    add_column :flatmates, :rent_range_max, :integer
    add_column :flatmates, :duration, :integer
    add_column :flatmates, :entry_date, :date
    add_column :flatmates, :registration, :integer
    add_column :flatmates, :room_size_min, :integer
    add_column :flatmates, :room_size_max, :integer
    add_column :flatmates, :furnished, :integer
    end
end
