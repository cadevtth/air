class FlightsController < ApplicationController
  
  def index
    
    if params[:keyword].present?
      @flights = Flight.find_all_by_departure_code(params[:keyword].upcase)
    else
      @flights = Flight.all
    end
    
    # @flights = Flight.page(params[:page]).per(2)
    
    # ?page=5
    # @page = params[:page].to_i
    # if @page < 1
    #   @page = 1
    # end
    
    # @flights = Flight.offset((@page - 1) * 2).limit(2).order("departs_at asc")
  end
  
end