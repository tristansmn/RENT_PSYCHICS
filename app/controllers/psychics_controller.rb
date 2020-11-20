class PsychicsController < ApplicationController

  before_action :find_psychic, only: [ :show, :edit, :update, :destroy ]

  def index
    if params[:query].present?
      sql_query = " \
        psychics.specialty ILIKE :query \
        OR psychics.localisation ILIKE :query \

        OR users.name ILIKE :query \
      "
      @psychics = Psychic.joins(:user).where(sql_query, query: "%#{params[:query]}%")
    else
      @psychics = Psychic.all
    end
  end
# OR accessories.name ILIKE :query \
  # .joins(:accessory)

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
    @accessory = Accessory.new
    @booking = Booking.new
  end


  def edit
  end

  def update
    @psychic.update(psychic_params)
    if @psychic.save
      redirect_to @psychic, notice: 'Psychic profile was successfuly edited'
    else
      render :edit
    end
  end

  def destroy
    @psychic.destroy
    redirect_to psychics_path
  end

  private

  def find_psychic
  @psychic = Psychic.find(params[:id])
  end

  def psychic_params
    params.require(:psychic).permit(:specialty, :localisation, :hour_rate, :photo)
  end
end
