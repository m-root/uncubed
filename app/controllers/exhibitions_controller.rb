class ExhibitionsController < ApplicationController
  before_action :set_exibition, only: [:upvote, :downvote, :show]
  before_action :set_gallery, only: [:index, :new, :create]

  def index
    @exhibitions = @gallery.exhibitions
    respond_to do |format|
      format.json do 
        render :json => @exhibitions
      end
      format.html do 
        render :index
      end
    end
  end

  def new
    @exhibition = @gallery.exhibitions.new
  end

  def create
    @exhibition = @gallery.exhibitions.new(exhibition_params)
    if @exhibition.save
      redirect_to @gallery
    else
      flash.now[:alert] =  @exhibition.errors.full_messages
      render :new
    end
  end

  def show
    @comment = @exhibition.comments.new
  end

  def upvote
    @exhibition.upvote_by current_user
    redirect_to :back
  end

  def downvote
     @exhibition.downvote_by current_user
     redirect_to :back
  end

  private

  def set_exibition
    @exhibition = Exhibition.find(2)
  end

  def set_gallery 
    @gallery = Gallery.find(params[:gallery_id])
  end
  
  def exhibition_params
    params.require(:exhibition).permit(:title, :artist, :date_begin, :date_end)
  end
end