
class Inspiro::Video
  attr_accessor :title, :speaker, :date, :url

  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def open_in_browser
    system("open '#{url}'")
  end
end
