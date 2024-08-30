class FlatmatesController < ApplicationController
  # before_action :set_flatmate, only: [:edit, :update]
  before_action :authenticate_user!

  def index
    @flatmates = Flatmate.joins(:likes).where(likes: { liked: current_user.host })
  end

  def new
    @flatmate = Flatmate.new
  end

  def create
    @flatmate = Flatmate.new(step1_params)
    @flatmate.user = current_user
    @flatmate.save
    redirect_to flatmate_edit2_path(@flatmate)
  end

  def edit2
    @flatmate = Flatmate.find(params[:id])
  end

  def update
    @flatmate = Flatmate.find(params[:id])
   if  @flatmate.update!(flatmate_params)
    redirect_to params[:step] == "3" ? tutorial_path : flatmate_edit3_path(@flatmate)
   else
    render params[:step] == "2" ? :edit2 : :edit3
   end
  end

  def edit3
    @flatmate = Flatmate.find(params[:id])
  end

  def show
    @flatmate = Flatmate.find(params[:id])
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

  def edit2_params
    params.require(:flatmate).permit(:city, :district, :rent_min, :rent_max, :entry_date, :duration, :registration)
  end

  def edit3_params
    params.require(:flatmate).permit(:room_size_min, :room_size_max, :flatmates_min, :flatmates_max, :furnished)
  end

  def flatmate_params
    params.require(:flatmate).permit(:first_name, :last_name, :date_of_birth, :gender, :pronouns, :email_address, :phone_number,
    :city, :district, :rent_min, :rent_max, :entry_date, :duration, :registration, :room_size_min, :room_size_max, :furnished)
  end
end
