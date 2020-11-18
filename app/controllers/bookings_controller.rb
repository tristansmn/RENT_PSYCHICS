class BookingsController < ApplicationController
  before_action :find_booking, only: [ :show ]
  before_action :set_psychic, only: [ :new, :create ]

  def new
    # creer un nouveau booking en tant que user
    @booking = Booking.new
  end

  def create
    # creer un nouveau booking en tant que user
    # a la con
    @booking = Psychic.new(booking_params)
    @booking.user = current_user
    @booking.psychic_id = @psychic.id
    
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def show
    # montrer le booking pour voir les infos et le statut
  end

  def edit
    # seulement pour le user qui possede le FT du booking --> accepter ou refuser le booking
    # default: pending, accepted/declined
  end

  def update
    # seulement pour le user qui possede le FT du booking --> accepter ou refuser le booking
    # default: pending, accepted/declined
    # question --> comment on pourrait faire pour faire deux methodes de type update sur 2 champs different
    #   par exemple si le FT peut updater le statut et le user updater la date du booking?
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def set_psychic
    @psychic = Psychic.find(params[:psychic_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :nb_accessories, :total_price)
  end

end
