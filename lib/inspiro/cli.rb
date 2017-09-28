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
        puts "For more details, choose the video number."
        input = gets.strip
          video_selection = Inspiro::Video.find(input.to_i)
          video_details(video_selection)
        puts ""
        puts "Would you like more inspiration?"
        puts "Enter Y or N"
        input = gets.strip.downcase
        if input == "y"
          menu
        elsif input == "n"
          goodbye
          exit
        else
          puts "I'm not sure what you'd like."
          menu
        end
      elsif choice.to_i == 2
        Inspiro::Scraper.new.scrape_article_page
        list_articles
        puts "For more details, choose the article number."
        input = gets.strip
          article_selection = Inspiro::Article.find(input.to_i)
          article_details(article_selection)
          puts ""
          puts "Would you like more inpsiration?"
          puts "Enter Y or N"
          input = gets.strip.downcase
          if input == "y"
            menu
          elsif input == "n"
            goodbye
            exit
          else
            puts "I'm not sure what you'd like."
            menu
          end
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
    Inspiro::Video.all.each_with_index do |video, index|
      puts "#{index + 1}. #{video.title} - #{video.speaker}"
    end
  end

  def video_details(video_selection)
      puts "#{video_selection.title} - #{video_selection.speaker} - #{video_selection.date} - #{video_selection.category}"
      puts "#{video_selection.url}"
  end

  def list_articles
    Inspiro::Article.all.each_with_index do |article, index|
      puts "#{index + 1}. #{article.title} - #{article.author}"
    end
  end

  def article_details(article_selection)
      puts "#{article_selection.title} - #{article_selection.author}"
      puts "#{article_selection.summary} - #{article_selection.date}"
      puts "#{article_selection.url}"
  end








end

#- Find the category selector
#- Make sure that asking for input from user
#- Run input from user (number of video)
#- Use that find method to find that video object

#doc.xpath("//div[@class='c-4 nr nt']/ul[3]/li").text
#doc.css("div.c-4.nr.nt ul[3] li").text
