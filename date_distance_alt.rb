require 'date'
require 'timecop'

class DateDistance
  attr_accessor :start_date, :end_date, :distance, :past_or_present

  def initialize(end_date, start_date = Date.today)
    if end_date < start_date
      @start_date = end_date
      @end_date = start_date
      @past_or_present = :past
    else
      @start_date = start_date
      @end_date = end_date
      @past_or_present = :future
    end

    @distance = @end_date.yday - @start_date.yday

  end

  def to_s
    if @distance == 1
      if @past_or_present == :future 
        "Tomorrow"
      else
        "Yesterday"
      end
    end
  end
end

y, m, d = Date.today.to_s.split('-') # => ["2015", "09", "20"]
end_date = Date.parse("#{y}/#{m}/#{d.to_i - 1}")

date = DateDistance.new(end_date)

date.to_s # => "Yesterday"
