class PhotosController < ApplicationController
  def new
    @photo = Photo.new  #initialize an empty object for the form, so that we can fill in with details using the form.
    render template: "photos/new"
  end

  def create 
    @photo = Photo.new(photo_params)
   

    if @photo.save
       flash[:success] = "You uploaded your photo!"
       redirect_to :root
    else
      flash[:error] = "Something's wrong. Please try again."
      render 'page/index'
    end
  end


  def detect  
  	rekog = Aws::Rekognition::Client.new(region: "us-west-2")

    result = rekog.detect_labels({
      image: {
        s3_object: {
        bucket: "jasmine-rekog",
        name: "maru.jpg"
        },
      }
    })
    #byebug
    redirect_to :root
  end 

  private
  def photo_params
  	params.require(:photo).permit(:photo_url) 
  end 


end
