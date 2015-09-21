require 'date'

class DateDistance

#  Success criteria
#    User enters date
#    Explains to User the nearest
#    leap day

    today = Date.today
    day = Date.today.day
    month = today.month
  
  def self.time_distance_return(user_date)
    user_day = user_date.day
    user_month = user_date.month
    today = Date.today
    day = today.day
    month = today.month
#    if month == user_month
#      false
      # Check if the user date is in the future
    month if user_month > month && user_day = day
      #"#{user_day - day} day(s) and #{user_month - month} month(s) ahead of today"
#    elsif user_month < month && user_day <= day
      # "#{day - user_day} day(s) and #{month - user_month} month(s) before today"
  end

  def self.date_to_text(user_input)
    user_date = Date.parse(user_input.to_s)
    user_day = user_date.day
    user_month = user_date.month
    today = Date.today
    day = today.day
    month = today.month

    return "tomorrow" if today + 1 == user_date
    return "yesterday" if today - 1 == user_date

    if user_day == day
      return "1 month from today." if user_month >= month && user_month == month + 1
      return "#{user_month - month} months from today." if user_month > month && user_day == day
    end

    if user_date > today
      days_to_the_future = (user_day - day)
      return "#{user_month - month} month and #{user_day - day} days from today." if user_month == month + 1
      return "#{user_month - month} months and #{user_day - day} days from today." if user_month >= month + 2
    end

    if user_date < today
      back_to_the_past = (today.yday - user_date.yday)
      "#{back_to_the_past} days before today."
    else user_date > today
      back_to_the_future = (user_date.yday - today.yday)
      "#{back_to_the_future} days from today."
    end
  end 
end
