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
    # Travels to the city_url target calls Nokogiri (do you need .read?)
    nokogiri_object = Nokogiri::HTML(open(city_url).read)
    postings_link = nokogiri_object.xpath("//a[@class='result-title hdrlnk']/@href")
    # Loops through each posting.
    postings_link.each do |link|
      nokogiri_object2 = Nokogiri::HTML(open(link).read)
      title = nokogiri_object2.xpath("//span[@id='titletextonly']").text.strip
      Posting.create!(posting_link: link,
                      posting_title: title
                      # posting_body: body,
                      # posting_price: price,
                      # posting_bedroom: bedroom,
                      # posting_square_feet: square_feet,
                      # posting_specific_location: specific_location,
                      # posting_address: address,
                      # posting_email: email,
                      # posting_phone: phone,
                      # posting_housing_type: housing_type,
                      # posting_date_posted: date_posted,
                      # posting_post_id: post_id,
                      # posting_parking: parking,
                      # posting_furnished: furnished,
                      # posting_wheelchair: wheelchair,
                      # complete: nil,
                      # discrimination: nil
                      )
    end
  end

end


#
