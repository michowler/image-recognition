class PhotosController < ApplicationController
  def index 
    @photo = Photo.new
  end


  def new
    @photo = Photo.new  #initialize an empty object for the form, so that we can fill in with details using the form.
    render template: "photos/new"
  end

  def create 
    @photo = Photo.new(photo_params)
    if @photo.save
      respond_to do |format|
        format.json{ render :json => @photo, :only => [:id] }
        format.html
        format.js
      end
      @uploaded_photo = Photo.find(@photo.id)
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
        bucket: "jasmine-rekog",
        name: "uploads/photo/image/#{params[:photo_id]}/#{@photo.image_identifier}"
        },
      }
    })
    @photo.description = result.labels 
    @photo.save
    redirect_to @photo
  end 

  private
  def photo_params
  	params.require(:photo).permit(:image, description: []) 
  end 


end
