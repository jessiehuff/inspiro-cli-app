#CLI Controller

class Inspiro::CLI
  def call
    Inspiro::Scraper.new.print_videos
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
        make_videos
        add_attributes_to_videos
        display_videos
        binding.pry
      elsif choice.to_i == 2
        puts "option 2"
        menu
        #make_articles
        #add_attributes_to_articles
        #display_articles
      elsif choice.to_i == 3
        puts "option 3"
        menu
        #make_quotes
        #add_attributes_to_quotes
        #display_quotes
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
