module TimeHelper
  def to_hours_minutes(minutes)
    hours, minutes = minutes.divmod(60)
    "#{hours} h #{minutes} min"
  end

  def date_readable(date)
    date.strftime("%A, %b %d %H:%M")
  end
end
