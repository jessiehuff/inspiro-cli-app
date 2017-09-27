
class Article
  attr_accessor :title, :author, :summary, :date, :url

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

end
