class AlbumsController < ApplicationController
  before_action :require_user!

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to album_url(@album)
    else
      @band = @album.band
      render :new
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to band_url(@album.band_id)
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def new
    @band = Band.find(params[:band_id])
    @album = Album.new(band_id: params[:band_id])
    render :new
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def update
    @album = Album.find(params[:id])

    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      render :edit
    end
  end

  private
  def album_params
    params.require(:album).permit(:band_id, :live, :name, :year)
  end
end
