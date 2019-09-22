class BookingsController < ApplicationController
  def new
    redirect_to request.referer and return if booking_params[:flight_id].nil?
    @booking = Booking.new(flight_id: booking_params[:flight_id])
    @flight_details = Flight.includes(:from_airport, :to_airport).find(booking_params[:flight_id])
    booking_params[:num_passengers].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(flight_id: booking_params[:flight_id])
    @flight_details = Flight.includes(:from_airport, :to_airport).find(booking_params[:flight_id])
    @booking.create_associated_passengers(booking_params[:passengers_attributes])

    if !@booking.new_record?
      redirect_to @booking
      @booking.passengers.each do |passenger|
        PassengerMailer.with(passenger: passenger, booking: @booking).thank_you_email.deliver_later
      end
      return
    else
      render 'new'
    end
  end

  def show
    @booking = Booking.includes(flight: [:from_airport, :to_airport])
                        .find(params[:id])
    @flight = @booking.flight
    @passengers = @booking.passengers
  end


  private
    def booking_params
      params.require(:booking).permit(:flight_id,
                                      :num_passengers,
                                      passengers_attributes: [:name, :email])
    end
end
