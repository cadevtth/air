class FlightsController < ApplicationController
  
  def index
    
    if params[:keyword].present?
      # @flights = Flight.find_all_by_departure_code(params[:keyword].upcase)
      
      # @flights = Flight.where(:departure_code => params[:keyword])
      # @flights = Flight.where("departure_code = ?", pams[:keyword])
      # @flights = Flight.where("departure_code = ? OR arrival_code = ?", params[:keyword], params[:keyword])
      # @flights = Flight.where("departure_code LIKE ?", "#{params[:keyword]}")
      
      @flights = Flight.where("departure_code LIKE ?", "%#{params[:keyword]}%").page(params[:page]).per(2)
      
    else
      @flights = Flight.page(params[:page]).per(2)
    end
    
    # ?page=5
    # @page = params[:page].to_i
    # if @page < 1
    #   @page = 1
    # end
    
    # @flights = Flight.offset((@page - 1) * 2).limit(2).order("departs_at asc")
  end
  
end