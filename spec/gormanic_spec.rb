require "date"
require 'spec_helper'

def ordinalize(number)
  abs_number = number.to_i.abs

  if (11..13).include?(abs_number % 100)
    "th"
  else
    case abs_number % 10
      when 1; "st"
      when 2; "nd"
      when 3; "rd"
      else    "th"
    end
  end
end

def gorman_month(month_no)
  %w(March April May June Quintilis Sextilis September October November December January February Gormanuary)[month_no]
end
def gormanize(gregorian_date)
  return "Intermission" if gregorian_date.yday > 364
  month, day = gregorian_date.yday.divmod 28
  if day == 0
    day = 28
    # month += 1
  end
  if gregorian_date.leap? && gregorian_date.yday > 59
    day -= 1
  end
  "#{ day }#{ordinalize(day)} #{ gorman_month(month) } #{ gregorian_date.year }"
end

describe "converting gregorian dates to gormanic dates" do
  context "the last day of the year is Intermission" do
    it "converts 31st December to 'Intermission'" do
      last_day_of_year = Date.new(2016,12,31)
      expect(gormanize(last_day_of_year)).to eql("Intermission")
    end
  end

  {
    Date.new(2016, 1, 1)  => "1st March 2016",
    Date.new(2016, 1, 29) => "1st April 2016",
    Date.new(2016, 1, 30) => "2nd April 2016",
    Date.new(2016, 3, 2)  => "5th May 2016",
    Date.new(2016, 11, 5) => "1st February 2016",
    Date.new(2016, 4, 1)  => "7th June 2016",
    Date.new(2015, 3, 2)  => "5th May 2015",
    Date.new(2015, 11, 5) => "1st February 2015",
    Date.new(2015, 4, 1)  => "7th June 2015",
    Date.new(2015, 12, 30)  => "28th Gormanuary 2015",
    Date.new(2015, 12, 31)  => "Intermission",
    Date.new(2016, 12, 30)  => "Intermission",
    Date.new(2016, 12, 31)  => "Intermission",
  }.each_pair do |gregorian, gormanic|
    it "converts #{ gregorian } to #{ gormanic }" do
      expect(gormanize(gregorian)).to eql(gormanic)
    end
  end
end
