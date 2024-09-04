class UsersController < ApplicationController
  before_action :set_user, only: [:edit_profile, :update_profile, :dashboard]

  def choose_role
  end

  def role
    if params[:user][:role] == 'flatmate'
      current_user.role = 'flatmate'
      current_user.save!
      redirect_to new_flatmate_path
    else
      current_user.role = 'host'
      current_user.save!
      redirect_to new_host_path
    end
  end
  # Dashboard for user profile
  def dashboard
    if current_user.flatmate
      @flatmate = current_user.flatmate
      @living_preference = @flatmate.living_preference
    elsif current_user.host
      @host = current_user.host
      @living_preference = @host.living_preference
    end
  end

  # Edit user data (Onboarding data)
  def edit_profile
    @is_host = current_user.host?
    @profile = @is_host ? current_user.host : current_user.flatmate
  end

  # Update user data
  def update_profile
    if current_user.host?
      if current_user.host.update(host_params)
        redirect_to user_dashboard_path, notice: 'Profile updated successfully.'
      else
        render :edit_profile, alert: 'Unable to update profile.'
      end
    else
      if current_user.flatmate.update(flatmate_params)
        redirect_to user_dashboard_path, notice: 'Profile updated successfully.'
      else
        render :edit_profile, alert: 'Unable to update profile.'
      end
    end
  end

  private

  def set_user
    @user = current_user
  end

  def host_params
    params.require(:host).permit(:first_name, :last_name, :date_of_birth, :gender, :pronouns, :email_address, :phone_number, :city, :district, :entry_date, :duration, :registration, :furnished, :rent, :room_size, :address, :street, :postcode, :country)
  end

  def flatmate_params
    params.require(:flatmate).permit(:first_name, :last_name, :date_of_birth, :gender, :pronouns, :email_address, :phone_number, :city, :district, :entry_date, :duration, :registration, :furnished, :rent_range_min, :rent_range_max, :room_size_min, :room_size_max)
  end
end


# # # common
# :first_name
# :last_name
# :date_of_birth
# :gender
# :pronouns
# :email_address
# :phone_number
# :city
# :district
# :entry_date
#  :duration
#  :registration
# :furnished

# # # flatmate
# :rent_range_min
# :rent_range_max
# :room_size_min
# :room_size_max

# # # host
# :rent
# :room_size
# # :address
# # :street
# # :postcode
# # :country
