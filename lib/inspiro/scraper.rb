require 'pry'

class Inspiro::Scraper

  def scrape_video_page
    doc = Nokogiri::HTML(open("https://www.ted.com/talks?sort=newest&topics%5B%5D=Technology&topics%5B%5D=Business"))
    doc.css(".m3").collect do |video_info|
      Inspiro::Video.new_from_video_page(video_info)
    end
  end


  def scrape_article_page
    doc = Nokogiri::HTML(open("https://www.goalcast.com/category/self-improvement/"))
    doc.css(".td_module_10").collect do |article_info|
      Inspiro::Article.new_from_article_page(article_info)
    end
  end

  def scrape_quote_page
    doc = Nokogiri::HTML(open("http://www.wiseoldsayings.com/funny-motivational-quotes/"))
    doc.css(".quote").collect do |quote_info|
      Inspiro::Quote.new_from_quote_page(quote_info)
      end
    end
end
