class FlatmatesController < ApplicationController
  # before_action :set_flatmate, only: [:edit, :update]
  before_action :authenticate_user!

  def new
    @flatmate = Flatmate.new
    @step = params[:step].to_i || 1
  end


  def create
    @flatmate = Flatmate.new(step1_params)
    @flatmate.user = current_user
    @flatmate.save
    redirect_to edit2_path(@flatmate)

  end

#   def edit
#     @flatmate = Flatmate.find(params[:id])
#   end

#   def update
#     @flatmate = Flatmate.find(params[:id])

#     if @flatmate.update(flatmate_params)
#       redirect_to @flatmate, notice: 'Your flatmate profile was successfully updated.'
#     else
#       render :edit
#     end
#   end

#   def destroy
#     @flatmate = Flatmate.find(params[:id])
#     @flatmate.destroy
#     redirect_to flatmates_path, notice: 'Your flatmate profile was successfully deleted.'
#   end

  private

  def set_flatmate
    @flatmate = Flatmate.find_or_initialize_by(id: session[:flatmate_id]) || Flatmate.new
    session[:flatmate_id] = @flatmate.id if @flatmate.persisted?
  end

  def step1_params
    params.require(:flatmate).permit(:first_name, :last_name, :date_of_birth, :gender, :pronouns, :email_address, :phone_number)
  end

  def step2_params
    params.require(:flatmate).permit(:city, :district, :rent_min, :rent_max, :entry_date, :duration, :registration)
  end

  def step3_params
    params.require(:flatmate).permit(:room_size_min, :room_size_max, :flatmates_min, :flatmates_max, :furnished)
  end

  def flatmate_params
    params.require(:flatmate).permit(:name, :city, :user_id)
  end
end
