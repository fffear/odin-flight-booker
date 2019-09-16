module FlightsHelper
  def date_range_start(date)
    start_date_as_integer = Time.zone.parse(date).to_i
    Time.zone.at(start_date_as_integer)
  end

  def date_range_end(date)
    end_date_as_integer = Time.zone.parse(date).to_i + 1
    Time.zone.at(end_date_as_integer)
  end

  def prefilled_flight_details(attr_name)
    params[:flight] ? params[:flight][attr_name] : nil
  end
end
