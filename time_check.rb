

class TimeCheck
  def self.current_month(user_input)
    # check month
    # check if date is same day or greater away.
    user_date = Date.parse(user_input.to_s)
    user_day = user_date.day
    user_month = user_date.month
    today = Date.today
    day = Date.today.day
    month = today.month

  def self.month_and_day_return
    if month == user_month
      false
      # Check if the user date is in the future
    elsif user_month > month && user_day >= day
      "#{user_day - day} day(s) and #{user_month - month} month(s) ahead of today"
    elsif user_month < month && user_day =< day
      "#{day - user_day} day(s) and #{month - user_month} month(s) before today"
    else
      return "exploded on month check!"
    end
end
