class AlbumsController < ApplicationController

  def new
    @album = Album.new
    @album.band = Band.find(params[:band_id])
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    end
  end

  def update
  end

  private
  def album_params
    params.require(:albums).permit(:band_id, :title, :recording_type)
  end

end
