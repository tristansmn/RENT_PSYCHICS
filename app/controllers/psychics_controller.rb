class PsychicsController < ApplicationController

  before_action :find_psychic, only: [ :show ]

  def index
    @psychics = Psychic.all
  end

  def new
  	@psychic = Psychic.new
  end

  def create
  	@psychic = Psychic.new(psychic_params)
  	@psychic.user = current_user

  	if @psychic.save
  	  redirect_to @psychic, notice: 'Psychic profile was successfuly completed'
  	else
  	  render :new
  	end
  end

  def show
  end


  private

  def find_psychic
  @psychic = Psychic.find(params[:id])
  end

  def psychic_params
    params.require(:psychic).permit(:specialty, :localisation, :hour_rate, :photo)
  end
end
