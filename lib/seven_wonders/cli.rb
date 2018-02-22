require_relative 'seven_wonders'
require_relative 'scraper'
class SevenWonders::CLI

  def initialize
    SevenWonders::Scraper.get_page
  end

  def call
    puts "The Seven Wonders of the Ancient World"
    list_names_with_numbers
    menu
    goodbye
  end

  def menu
    puts "Enter the number of the one you'd like to learn more about or to list them  again type list or type exit."
    input = nil
    while input != "exit"
      input = gets.strip
      if input == "list"
        list_names_with_numbers
      elsif  input == "exit"
        return
      else
        get_info_by_number(input.to_i)
      end
    end
  end

  def goodbye
    puts "Have a great day!"
  end

  def wonders_array
    wonders = SevenWonders::Scraper.get_page
    SevenWonders::Wonder.create_from_scraper(wonders)
  end

  def list_names_with_numbers
    SevenWonders::Wonder.all.each.with_index do |wonder,index|
      puts "#{index + 1}. #{wonder.name}"
    end
  end

  def get_info_by_number(i)
    puts  SevenWonders::Wonder.all[i - 1].info
  end
end
