require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def self.get_page
    html = Nokogiri::HTML(open('http://www.history.com/topics/ancient-history/sevens-wonders-of-the-ancient-world'))
    wonders_array = []

    html.css("div article div.accordion-group").each do |wonder|
      wonders_hash = {
        :name => wonder.css("h2").text,
        :info => wonder.css("div p").text
      }
      wonders_array << wonders_hash
    end
    wonders_array
  end


end
