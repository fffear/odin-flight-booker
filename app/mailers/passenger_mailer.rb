class PassengerMailer < ApplicationMailer

  def thank_you_email
    @booking = params[:booking]
    @passenger = params[:passenger]
    @url = booking_url(@booking)
    
    mail(to: @passenger.email, subject: 'Ticket booking confirmed')
  end
end
