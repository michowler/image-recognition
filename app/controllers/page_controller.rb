class PageController < ApplicationController
  def index
  	@photo = Photo.new
  end

end
