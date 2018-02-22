require_relative 'scraper'
class Wonder
  attr_accessor :name, :info
  @@all = []

  def initialize(wonder_hash)
    wonder_hash.each{|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.create_from_scraper(wonders_array)
    wonders_array.each do |wonders|
      new_wonder = Wonder.new(wonders)
    end
    self.all
  end

  def self.all
    @@all
  end

  def find_by_number(i)
    self.all[id-1]
  end

  def find_by_name(name)

  end
end

scrape = Scraper.get_page
Wonder.create_from_scraper(scrape)
Wonder.all
