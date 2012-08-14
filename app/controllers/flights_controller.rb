class FlightsController < ApplicationController
  
  def index
    
    @flights = Flight.page(params[:page]).per(2)
    
    # ?page=5
    # @page = params[:page].to_i
    # if @page < 1
    #   @page = 1
    # end
    
    # @flights = Flight.offset((@page - 1) * 2).limit(2).order("departs_at asc")
  end
  
end