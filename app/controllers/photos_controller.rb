class PhotosController < ApplicationController
  # after_action :detect, only: [:create]
  def index 
    @photo = Photo.new
    #@photos = Photo.all
    # if params[:rid]
    #   @uploaded_photo = Photo.find(params[:rid])
    # end
  end


  def new
    @photo = Photo.new  #initialize an empty object for the form, so that we can fill in with details using the form.
    render template: "photos/new"
  end

  def create 
    @photo = Photo.new(photo_params)
    if @photo.save
      # render :json => @photo
        # respond_to do |format|
        # format.html
        # format.json { render :json => @photo}
      respond_to do |format|
        format.js
        format.html
      end
       # flash[:success] = "You uploaded your photo!"
       # redirect_to @photo
    else
      respond_to do |format|
        format.json { render json: { error: 'Failed to process' } }
      end
      # flash[:error] = "Something's wrong. Please try again."
      # render 'page/index'
    end
  end


  def show
    # @photo = Photo.new
    @photo = Photo.find(params[:id])
  end 

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update(photo_params)
    redirect_to @photo
  end


  def detect 
    @photo = Photo.find(params[:photo_id])
  	rekog = Aws::Rekognition::Client.new(region: "us-west-2")
    result = rekog.detect_labels({
      image: {
        s3_object: {
        bucket: "jasmine-rekoq",
        name: "uploads/photo/image/#{params[:photo_id]}/#{@photo.image_identifier}"
        },
      }
    })
    @photo.description = result.labels 
    @photo.save
    #if @photo.save
    #   respond_to do |format|
    #     format.js
    #     format.html
    #   end
    # else
    #   respond_to do |format|
    #     format.json { render json: { error: 'Failed to process' } }
    #   end
    # end
    # redirect_to @photo
  end 

  private
  def photo_params
  	params.require(:photo).permit(:image, description: []) 
  end 


end
