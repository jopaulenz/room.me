class LivingPreferencesController < ApplicationController
  before_action :set_living_preference, only: [:edit, :update]

  # GET /living_preferences/new
  def new
    @living_preference = LivingPreference.new
    @step = params[:step].to_i || 1
  end

  # POST /living_preferences
  def create
    @living_preference = LivingPreference.new(living_preference_params)
    @living_preference.preferable = current_user # oder eine andere Logik, um das preferable Objekt zu setzen

    if @living_preference.save
      redirect_to edit_living_preference_path(@living_preference, step: 2), notice: 'Living preferences were successfully created.'
    else
      @step = 1
      render :new
    end
  end

  # GET /living_preferences/:id/edit
  def edit
    @step = params[:step].to_i || 1
  end

  # PATCH/PUT /living_preferences/:id
  def update
    @step = params[:step].to_i || 1

    if @living_preference.update(living_preference_params)
      if @step < 3
        next_step = @step + 1
        redirect_to edit_living_preference_path(@living_preference, step: next_step), notice: 'Living preferences were successfully updated.'
      else
        redirect_to root_path, notice: 'Living preferences were successfully completed.'
      end
    else
      render :edit
    end
  end

  private

  def set_living_preference
    @living_preference = LivingPreference.find(params[:id])
  end

  def living_preference_params
    params.require(:living_preference).permit(
      :cleanliness, :gender, :smoking, :partying, :age,
      :furnished, :dishwasher, :washingmaschine, :balcony,
      :kitchen, :bathtub, :aboutme, :interest
    )
  end
end
