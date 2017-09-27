
class Inspiro::Video
  attr_accessor :title, :speaker, :date, :url

  @@all = []

  def initialize
    @title = title
    @speaker = speaker
    @date = date
    @url = url
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def open_in_browser
    system("open '#{url}'")
  end
end
