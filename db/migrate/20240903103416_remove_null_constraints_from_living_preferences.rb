class RemoveNullConstraintsFromLivingPreferences < ActiveRecord::Migration[7.1]
  def change
    change_column_null :living_preferences, :preferable_type, true
    change_column_null :living_preferences, :preferable_id, true
    change_column_null :living_preferences, :cleanliness, true
    change_column_null :living_preferences, :gender, true
    change_column_null :living_preferences, :smoking, true
    change_column_null :living_preferences, :partying, true
    change_column_null :living_preferences, :age, true
    change_column_null :living_preferences, :furnished, true
    change_column_null :living_preferences, :dishwasher, true
    change_column_null :living_preferences, :washingmaschine, true
    change_column_null :living_preferences, :balcony, true
    change_column_null :living_preferences, :kitchen, true
    change_column_null :living_preferences, :bathtub, true
  end
end
