require './spec/spec_helper'
require './date_distance_alt'
require 'timecop'

describe DateDistance do
  it "should return tomorrow given tomorrows date" do
    day_after = (Date.today + 1)
    output = DateDistance.date_to_text(day_after)
    expect(output).to eq "tomorrow"
  end
  
  it "should return yesterday given yesterdays date" do
    day_before = (Date.today - 1)
    output = DateDistance.date_to_text(day_before)
    expect(output).to eq "yesterday"
  end

  it "should return '2 days from today.' given a date 2 days in the future" do
    expect(DateDistance.date_to_text(Date.today + 2)).to eq "2 days from today."
  end

  it "should return '2 days before today.' given a date 2 days in the past" do
    expect(DateDistance.date_to_text(Date.today - 2)).to eq "2 days before today."
  end

  it "should return '1 month from today.' given a date in the next month past the current date" do
    Timecop.freeze("2015/02/18")
    y, m, d = Date.today.to_s.split('-')
    month_ahead = Date.parse("#{y}/#{m.to_i + 1}/#{d}")
    expect(DateDistance.date_to_text(month_ahead)).to eq "1 month from today."
  end

  it "should return '2 months from today.' given a date in the next month past the current date" do
    Timecop.freeze("2015/02/18")
    y, m, d = Date.today.to_s.split('-')
    month_ahead = Date.parse("#{y}/#{m.to_i + 2}/#{d}")
    expect(DateDistance.date_to_text(month_ahead)).to eq "2 months from today."
  end

  it "should return '2 months and 14 days from today.' given a date in the next month past the current date" do
    Timecop.freeze("2015/02/01")
    y, m, d = Date.today.to_s.split('-')
    month_ahead = Date.parse("#{y}/#{m.to_i + 2}/#{d.to_i + 14}")
    expect(DateDistance.date_to_text(month_ahead)).to eq "2 months and 14 days from today."
  end


end
