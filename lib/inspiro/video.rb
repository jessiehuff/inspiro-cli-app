
class Inspiro::Video
  attr_accessor :title, :speaker, :date, :category, :url

  @@all = []

  def self.new_from_video_page(video_info)
    self.new(
    video_info.search(".h9").first.text.gsub("\n", ""),
    video_info.search(".h12").text.gsub("\n", ""),
    video_info.search(".meta__val").first.text.gsub("\n", ""),
    video_info.search(".meta__val")[1].text.gsub("\n", ""),
    "https://www.ted.com" + video_info.search(".ga-link").first["href"].gsub("\n", "")
    )
  end

  def initialize(title = nil, speaker = nil, date = nil, category = nil, url = nil)
    @title = title
    @speaker = speaker
    @date = date
    @category = category
    @url = url
    #binding.pry
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

  def open_in_browser
    system("open '#{url}'")
  end
end
