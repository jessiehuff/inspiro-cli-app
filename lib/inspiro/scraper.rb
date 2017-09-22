require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './video.rb'

class Inspiro::Scraper

  def self.scrape_video_page(index_url = "https://www.ted.com/talks?sort=newest&topics%5B%5D=Technology&topics%5B%5D=Business")
    @doc = Nokogiri::HTML(open(index_url))
    @doc.search(".media media").each do |video_info|
      video = Inspiro::Video.new

      video.title = video_info.search(".ga-link").text
      video.speaker = video_info.search(".h12 talk-link_speaker").text
      video.date = video_info.search(".meta_val").text
      video.url = video_info.search(".talk-link")["href"]
      video.scrape_video_page
    end
  end
end

  
