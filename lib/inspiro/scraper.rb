class Inspiro::Scraper

#  def self.scrape_video_page(index_url = "https://www.ted.com/talks?sort=newest&topics%5B%5D=Technology&topics%5B%5D=Business")
#    @doc = Nokogiri::HTML(open(index_url))
#    @doc.search(".media media").each do |video_info|
#      video = Inspiro::Video.new
#
#      video.title = video_info.search(".ga-link").text
#      video.speaker = video_info.search(".h12 talk-link_speaker").text
#      video.date = video_info.search(".meta_val").text
#      video.url = video_info.search(".talk-link")["href"]
#      video.scrape_video_page
#    end
#  end

  def get_page
    Nokogiri::HTML(open("https://www.ted.com/talks?sort=newest&topics%5B%5D=Technology&topics%5B%5D=Business"))
  end

  def get_videos
    self.get_page.css(".col")
  end

  def make_videos
    self.get_videos.collect.with_index do |videos, index|
      video_title = videos.css(".ga-link").text
      video_speaker = videos.css(".h12 talk-link_speaker").text
      video_date = videos.css(".meta_val").text
      video_title
    end
  end

  def print_videos
    self.make_videos.group_by do |videos, index|
      videos[0]
    end
  end
end

Inspiro::Scraper.new.print_videos
