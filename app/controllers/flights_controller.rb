class FlightsController < ApplicationController
  
  def index
    if params[:keyword].present?
      keyword = params[:keyword].upcase
      airport = Airport.where("UPPER(city) LIKE ? OR UPPER(code) LIKE ?", "%#{keyword}%", "%#{keyword}%")
      
      @flights = airport.departing_flights.page(params[:page]).per(25).first
    else
      @flights = Flight.page(params[:page]).per(25)
    end
  end
  
end