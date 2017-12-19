class Posting < ApplicationRecord
  require 'open-uri'

  validates :posting_link, :presence => true
  validates :posting_title, :presence => true
  validates :posting_body, :presence => true
  validates :posting_price, :presence => true
  validates :posting_bedroom, :presence => true
  validates :posting_square_feet, :presence => true
  validates :posting_specific_location, :presence => true
  validates :posting_address, :presence => true
  # validates :posting_email, :presence => true
  # validates :posting_phone, :presence => true
  validates :posting_housing_type, :presence => true
  validates :posting_date_posted, :presence => true
  validates :posting_post_id, :presence => true
  validates :posting_parking, :presence => true
  validates :posting_furnished, :presence => true
  validates :posting_wheelchair, :presence => true
  validates :complete, :presence => true
  validates :discrimination, :presence => true

  def self.craigslist_scraper(city_url)
    posting = []
    # Travels to the city_url target calls Nokogiri

    html_listings_page = open(city_url).read
    nokogiri_object = Nokogiri::HTML(html_listings_page)
    postings_link = nokogiri_object.xpath("//a[@class='result-title hdrlnk']/@href")

    # Loops through each posting.
    postings_link.each do |link|
      post_link = open(link).read
      nokogiri_object2 = Nokogiri::HTML(post_link)
      title = nokogiri_object2.xpath("//span[@id='titletextonly']").text
      posting.push(posting_title: title)
      binding.pry
    end
    posting
  end

end
