helpers do
  def current_user
    if session[:user_id]
     @current_user ||= User.find(session[:user_id])
    end
  end

  def time_difference
    seconds_since = (Time.now.to_i - self.created_at.to_i)
    if seconds_since >= 86400 #seconds per day
       days(seconds_since)
    elsif seconds_since >= 3600 #seconds per hour
       hours(seconds_since)
    elsif seconds_since >= 60
       minutes(seconds_since)
    else
      return "less than one minute ago"
    end
  end

  def days(seconds_since)
    days = seconds_since / 3600 / 24
    display_time(days, "day")
  end

  def hours(seconds_since)
    hours = seconds_since / 3600
    display_time(hours, "hour")
  end

  def minutes(seconds_since)
    minutes = seconds_since / 60
    display_time(minutes, "minute")
  end

  def display_time(amount, time_units)
    if amount == 1
      "#{amount} #{time_units} ago"
    else
      "#{amount} #{time_units}s ago"
    end
  end
end