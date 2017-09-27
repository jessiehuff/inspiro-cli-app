#CLI Controller
require 'pry'

class Inspiro::CLI
  def call
    puts "Welcome to Inspiro - your source for daily inspiration!"
    menu
    goodbye
  end

  def menu
    choice = nil
    puts ""
    puts "Please select 1 for Videos, 2 for Articles, and 3 for Quotes"
    puts "You can exit at any time by entering exit"
    puts ""
    puts "How would you like to be inspired today?"
    choice = gets.strip
      if choice.to_i == 1
        #binding.pry
        Inspiro::Scraper.new.scrape_video_page
        list_videos
        puts "For more details, enter 'details' and enter 'menu' to go back to the main menu."
        request = gets.strip
        if request.downcase == "details"
          video_details
        elsif request.downcase == "menu"
          menu
        else
          puts "I'm not sure what you'd like."
          menu
        end
      elsif choice.to_i == 2
        Inspiro::Scraper.new.scrape_articles
        menu
      elsif choice.to_i == 3
        Inspiro::Scraper.new.scrape_quotes
        menu
      elsif choice.downcase == "exit"
        goodbye
        exit
      else
        puts "I'm not sure what you'd like to see. Please select a number from 1-3"
        menu
      end
    end

  def goodbye
    puts "Thanks for joining us for some inspiration! We hope you now feel ready to take on the world!"
  end

  def list_videos
    #binding.pry
    Inspiro::Video.all.each_with_index do |video, index|
      puts "#{index + 1}. #{video.title} - #{video.speaker}"
    end
  end

  def video_details(number_chosen)
      puts "#{number_chosen.title} - #{number_chosen.speaker} - #{number_chosen.date} - #{number_chosen.category}"
      puts "#{number_chosen.url}"
  end
end

- Find the category selector
- Make sure that asking for input from user
- Run input from user (number of video)
- Use that find method to find that video object

doc.xpath("//div[@class='c-4 nr nt']/ul[3]/li").text
doc.css("div.c-4.nr.nt ul[3] li").text
