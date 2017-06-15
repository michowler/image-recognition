class PageController < ApplicationController
  def index
  	@photo = Photo.new
  	# result = params[:photo]
  	#i need to send the id of the photo when i analyze the image so i can show the results at the index page
  end

end
