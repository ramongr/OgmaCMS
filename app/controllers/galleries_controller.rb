class GalleriesController < ApplicationController
  # GET /galleries
  # GET /galleries.json
  def index
    @galleries = Gallery.all
  end

  # GET /galleries/1
  # GET /galleries/1.json
  def show
  	@gallery = Gallery.find(params[:id])
    @added_images = @gallery.photos.order(position: :asc)
  end
end
