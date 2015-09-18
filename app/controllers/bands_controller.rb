class BandsController < ApplicationController
  before_action :verify_login

  def new
    render :new
  end

  def create
    band = Band.new(bands_params)
    if band.save
      redirect_to band_url(band)
    else
      redirect_to bands_url
    end

  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    flash[:success] = "#{@band.name} sucessfully deleted"
    redirect_to bands_url
  end

  def index
    render :index
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    @band = Band.find(params[:id])
    if @band.update(bands_params)
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
