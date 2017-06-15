class PhotosController < ApplicationController
  def new
    @photo = Photo.new  #initialize an empty object for the form, so that we can fill in with details using the form.
    render template: "photos/new"
  end

  def create 
    @photo = Photo.new(photo_params)
   
    if @photo.save
       flash[:success] = "You uploaded your photo!"
       redirect_to @photo
    else
      flash[:error] = "Something's wrong. Please try again."
      render 'page/index'
    end
  end

  def show
    # @photo = Photo.new
    @photo = Photo.find(params[:id])
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
