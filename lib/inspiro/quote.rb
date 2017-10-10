class Inspiro::Quote
  attr_accessor :words, :author, :url

  @@all = []

  def self.new_from_quote_page(quote_info)
    self.new(
    quote_info.search("b").text,
    quote_info.search("i").text,
    "http://www.wiseoldsayings.com/funny-motivational-quotes/"
    )
  end

  def initialize(words = nil, author = nil, url = "http://www.wiseoldsayings.com/funny-motivational-quotes/")
    @words = words
    @author = author
    @url = url
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
