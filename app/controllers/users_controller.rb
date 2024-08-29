class UsersController < ApplicationController
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
end
