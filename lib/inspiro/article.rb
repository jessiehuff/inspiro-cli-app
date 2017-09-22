
class Article
  attr_accessor :title, :author, :date

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

end
