#CLI Controller

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
    while choice != "exit"
      if choice.to_i == 1
          Inspiro::Scraper.new.scrape_video_page
      elsif choice.to_i == 2
        puts "option 2"
        menu
      elsif choice.to_i == 3
        puts "option 3"
        menu
      elsif choice.downcase == "exit"
        exit
      else
        puts "I'm not sure what you'd like to see. Please select a number from 1-3"
        menu
      end
    end
  end

  def goodbye
    puts "Thanks for joining us for some inspiration! We hope you now feel ready to take on the world!"
  end
end
