#CLI Controller
require_relative "scraper.rb"
require 'nokogiri'

class Inspiro::CLI
  def call
    puts "Welcome to Inspiro - your source for daily inspiration!"
    menu
  end

  def menu
    choice = nil
    puts ""
    puts "Please select 1 for Videos, 2 for Articles, and 3 for Quotes"
    puts "You can exit at any time by entering exit"
    puts ""
    puts "How would you like to be inspired today?"
  end
end
