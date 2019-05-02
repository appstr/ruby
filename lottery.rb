require "csv"
require 'open-uri'
require 'nokogiri'
require 'byebug'

MONTHS = {
  "Jan"=> 1,
  "Feb"=> 2,
  "Mar"=> 3,
  "Apr"=> 4,
  "May"=> 5,
  "Jun"=> 6,
  "Jul"=> 7,
  "Aug"=> 8,
  "Sep"=> 9,
  "Oct"=> 10,
  "Nov"=> 11,
  "Dec"=> 12,
}

def scrape_data(url)
  html = open(url)
  doc = Nokogiri::HTML(html)

  dates = []
  draws = []
  powerballs = []

  doc.css('td').each do |td|
    if td.at_css('b font')
      # draws
      draws << td.at_css('b font').inner_html.strip
    elsif td.at_css('b')
      # dates
      dates << td.at_css('b').inner_html.strip
    else
      # powerballs
      powerballs << td.inner_html.strip.to_i if td.inner_html.strip.to_i != 0
    end
  end

  CSV.open("lotto.csv", "wb") do |csv|
    csv << ["date", "draw1", "draw2", "draw3", "draw4", "draw5", "powerball"]
    (0...powerballs.length).each do |num|
      date = sanitize_date(dates[num])
      draw1, draw2, draw3, draw4, draw5 = sanitize_draw(draws[num])
      csv << [date, draw1, draw2, draw3, draw4, draw5, powerballs[num]]
    end
  end
end

def sanitize_date(date)
  date = date.split(" ")
  date.shift
  day = date[1].split(",")[0].to_i
  month = MONTHS[date[0]]
  year = date[2].to_i
  Time.new(year, month, day)
end

def sanitize_draw(str)
  new_draw = []
  str.split("").each_with_index do |char, indx|
    if char != " "
      new_draw << char.to_i
    elsif str.split("")[indx - 1] != " "
      new_draw << " "
    end
  end
  join_draw(new_draw)
end

def join_draw(draw)
  new_draw = ""
  counter = 0
  final = []
  while counter < draw.length
    if draw[counter] == " " and draw[counter - 1] != " " and counter != 0
      final << new_draw
      new_draw = ""
    else
      new_draw += draw[counter].to_s
    end
    counter += 1
  end
  final << new_draw
  final.map(&:to_i)
end

url = "https://www.reducmiz.com/results_US_lotteries.php?game=powerball&nb=1000"
scrape_data(url)
