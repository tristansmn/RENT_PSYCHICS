class BookingsController < ApplicationController

  def new
    # creer un nouveau booking en tant que user
  end

  def create
    # creer un nouveau booking en tant que user
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

end
