class Inspiro::Scraper

  def scrape_video_page
    doc = Nokogiri::HTML(open("https://www.ted.com/talks?sort=newest&topics%5B%5D=Technology&topics%5B%5D=Business"))
    doc.css(".col").collect do |video_info|
      video = Inspiro::Video.new

      video.title = video_info.search("a .ga-link").text
      video.speaker = video_info.search("h4 .h12.talk-link__speaker").text
      video.date = video_info.search("span.meta__val").text
      video.url = video_info.search(".talk-link.ga-link")["href"]
      video
    end
  end
end

#  def get_page
#    Nokogiri::HTML(open("https://www.ted.com/talks?sort=newest&topics%5B%5D=Technology&topics%5B%5D=Business"))
#  end
#
#  def get_videos
#    self.get_page.css(".col")
#  end
#
#  def make_videos
#    self.get_videos.collect.with_index do |videos, index|
#      video_title = videos.css(".ga-link").text
#      video_speaker = videos.css(".h12 talk-link_speaker").text
#      video_date = videos.css(".meta_val").text
#      video_title
#    end
#  end
#
#  def print_videos
#    self.make_videos.group_by do |videos, index|
#      videos[0]
#    end
#  end
#
#Inspiro::Scraper.new.print_videos
