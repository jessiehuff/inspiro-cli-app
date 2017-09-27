require 'pry'

class Inspiro::Scraper

  def scrape_video_page
    doc = Nokogiri::HTML(open("https://www.ted.com/talks?sort=newest&topics%5B%5D=Technology&topics%5B%5D=Business"))
    doc.css(".m3").collect do |video_info|
      video = {}

      video[:title] = video_info.search(".h9").first.text
      video[:speaker] = video_info.search(".h12").text
      video[:date] = video_info.search(".meta__val").first.text
      video[:url] = video_info.search(".ga-link").first["href"]
      video
    end
  end


  def scrape_articles
    doc = Nokogiri::HTML(open("https://www.goalcast.com/category/self-improvement/"))
    doc.css(".td_module_10").collect do |article_info|
      article = {}
      binding.pry
      article[:title] = article_info.search(".entry-title").first.text
      article[:author] = article_info.search(".td-post-author-name").first.text
      article[:summary] = article_info.search(".td-excerpt").first.text
      article[:date] = article_info.search(".td-post-date").first.text
      article[:url] = article_info.search(".entry-title").first["href"] #still not sure why this line doesn't work
      article
    end
  end
end
