class FlightsController < ApplicationController
  include FlightsHelper

  def index
    @flights = Flight.all.includes(:from_airport, :to_airport)
    @airports = Airport.all.map { |a| [a.code, a.id] }
    @num_passengers = (1..4).map { |n| [n, n] }
    @flight_dates = @flights.map { |f| [f.date_formatted, f.start_datetime] }
    
    if !params[:flight].nil?
      @search_results = Flight.where("from_airport_id = ? AND
                                      to_airport_id = ? AND
                                      start_datetime >= ? AND
                                      start_datetime < ?",
                                      flight_params[:from_airport_id],
                                      flight_params[:to_airport_id],
                                      date_range_start(flight_params[:start_datetime]),
                                      date_range_end(flight_params[:start_datetime]))
                              .includes(:from_airport, :to_airport)
    end
  end

  private
    def flight_params
      params.require(:flight).permit(:from_airport_id,
                                     :to_airport_id,
                                     :start_datetime)
    end
end
