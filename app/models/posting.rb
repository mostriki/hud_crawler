class Posting < ApplicationRecord
  require 'open-uri'

  validates :posting_link, :presence => true
  # validates :posting_title, :presence => true
  # validates :posting_body, :presence => true
  # validates :posting_price, :presence => true
  # validates :posting_bedroom, :presence => true
  # validates :posting_square_feet, :presence => true
  # validates :posting_specific_location, :presence => true
  # validates :posting_address, :presence => true
  # validates :posting_email, :presence => true
  # validates :posting_phone, :presence => true
  # validates :posting_housing_type, :presence => true
  # validates :posting_date_posted, :presence => true
  # validates :posting_post_id, :presence => true
  # validates :posting_parking, :presence => true
  # validates :posting_furnished, :presence => true
  # validates :posting_wheelchair, :presence => true
  # validates :complete, :presence => true
  # validates :discrimination, :presence => true

  def self.craigslist_scraper(city_url)
    nokogiri_object = Nokogiri::HTML(open(city_url).read)
    posting_link = nokogiri_object.xpath("//a[@class='result-title hdrlnk']/@href")

    posting_link.each do |link|
      nokogiri_object2 = Nokogiri::HTML(open(link).read)
      posting_title = nokogiri_object2.xpath("//span[@id='titletextonly']").text.strip
      Posting.create!(posting_link: link,
                      posting_title: posting_title
                      # posting_body: posting_body,
                      # posting_price: posting_price,
                      # posting_bedroom: posting_bedroom,
                      # posting_square_feet: posting_square_feet,
                      # posting_specific_location: posting_specific_location,
                      # posting_address: posting_address,
                      # posting_date_posted: posting_date_posted,
                      # posting_post_id: posting_post_id,

                      # posting_email: posting_email,
                      # posting_phone: posting_phone,

                      # posting_housing_type: posting_housing_type,
                      # posting_parking: posting_parking,
                      # posting_furnished: posting_furnished,
                      # posting_wheelchair: posting_wheelchair,

                      # complete: nil,
                      # discrimination: nil
                      )
    end
  end
end
