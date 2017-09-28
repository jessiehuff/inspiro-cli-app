
class Inspiro::Article
  attr_accessor :title, :author, :summary, :date, :url

  @@all = []

  def self.new_from_article_page(article_info)
    self.new(
    article_info.search(".entry-title").first.text,
    article_info.search(".td-post-author-name").first.text,
    article_info.search(".td-excerpt").first.text,
    article_info.search(".td-post-date").first.text,
    article_info.search(".entry-title").first["href"] #still not sure why this line doesn't work
    )
  end

  def initialize(title = nil, author = nil, summary = nil, date = nil, url = nil)
    @title = title
    @author = author
    @summary = summary
    @date = date
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
