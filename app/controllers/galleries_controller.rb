 class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)
    if @gallery.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
    def gallery_params
      params.require(:gallery).permit(:name, :address)
    end
end
