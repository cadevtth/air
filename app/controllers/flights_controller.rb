class FlightsController < ApplicationController
  
  def index
    if params[:keyword].present?
      keyword = params[:keyword].upcase
      airport = Airport.where("UPPER(city) LIKE ? OR UPPER(code) LIKE ?", "%#{keyword}%", "%#{keyword}%").first
      
      @flights = airport.departing_flights.page(params[:page]).per(25)
    else
      @flights = Flight.page(params[:page]).per(25)
    end
  end
  
end