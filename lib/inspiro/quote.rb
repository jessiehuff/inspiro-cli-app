class Quote
  attr_accessor :words

  @@all = []

  def initialize
    @words = words
    @@all << self
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end
end
