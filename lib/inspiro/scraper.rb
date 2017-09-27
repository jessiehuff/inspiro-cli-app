require 'pry'

class Inspiro::Scraper

  def scrape_video_page
    doc = Nokogiri::HTML(open("https://www.ted.com/talks?sort=newest&topics%5B%5D=Technology&topics%5B%5D=Business"))
    doc.css(".m3").collect do |video_info|
      Inspiro::Video.new_from_video_page(video_info)
    #  binding.pry
    end
  end


  def scrape_articles
    doc = Nokogiri::HTML(open("https://www.goalcast.com/category/self-improvement/"))
    doc.css(".td_module_10").collect do |article_info|
      article = {}
      #binding.pry
      article[:title] = article_info.search(".entry-title").first.text
      article[:author] = article_info.search(".td-post-author-name").first.text
      article[:summary] = article_info.search(".td-excerpt").first.text
      article[:date] = article_info.search(".td-post-date").first.text
      article[:url] = article_info.search(".entry-title").first["href"] #still not sure why this line doesn't work
      article
    end
  end

  def scrape_quotes
    doc = Nokogiri::HTML(open("https://letterpile.com/quotes/100-Inspirational-Sayings-Quotes-and-Phrases"))
    doc.css(".txtd").collect do |quote_info|
      quote = {}
      #binding.pry
      quote[:words] = quote_info.search("li").each_with_index do |item, index|
        puts "#{index + 1}. #{item.text}"
        puts ""
      end
      quote
    end
  end
end
