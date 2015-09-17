class BandsController < ApplicationController

  def new
    render :new
  end

  def create
    band = Band.new(bands_params)
    if band.save
      redirect_to band_url(band)
    else
    end

  end

  def destroy
  end

  def index
    render :index
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url()
    end
  end

  def show
    @band = Band.find(params[:id])

  end

  private
  def bands_params
    params.require(:bands).permit(:name)
  end
end
