class AccessoriesController < ApplicationController
  before_action :set_psychic, only: [ :new, :create ]
  def show
  end

  def new
  	@accessory = Accessory.new
  end

  def create
    @accessory = Accessory.new(accessory_params)
    @accessory.psychic = @psychic

    if @accessory.save
    	redirect_to psychic_path(@psychic)
    else
    	redirect_to psychic_path(@psychic), notice: 'Please try again'
    end
  end

  private
  
  def set_psychic
    @psychic = Psychic.find(params[:psychic_id])
  end

  def accessory_params
    params.require(:accessory).permit(:name, :price)
  end
end
