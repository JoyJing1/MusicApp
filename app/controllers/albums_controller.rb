class AlbumsController < ApplicationController

    def new
      @bands = Band.all
      render :new
    end

    def create
      @album = Album.create(album_params)
      if @album.save!
        redirect_to album_url(@album)
      else
        flash[:errors] = @album.errors.full_messages
        render :new
      end
    end

    def edit
      @bands = Band.all
      @album = Album.find(params[:id])
      render :update
    end

    def update
      album = Album.find(params[:id])
      if band.update_attributes(album_params)
        redirect_to album_url(album)
      else
        flash[:errors] = ["Album credentials missing"]
        render :update
      end
    end

    def destroy
      album = Album.find(params[:id])
      album.destroy
    end

    def show
      @album = Album.find(params[:id])
      render :show
    end

    private
    def album_params
      params.require(:album).permit(:name, :band_id, :record_type)
    end

end
