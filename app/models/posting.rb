class Posting < ApplicationRecord
  require 'open-uri'
  require 'bigdecimal'
  require 'bigdecimal/util'

  # validates :posting_link, :presence => true
  # validates :posting_title, :presence => true
  # validates :posting_body, :presence => true
  # validates :posting_price, :presence => true
  # validates :posting_bedroom, :presence => true
  # validates :posting_square_feet, :presence => true
  # validates :posting_location, :presence => true
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
      posting_body = nokogiri_object2.xpath("//section[@id='postingbody']").text
      posting_price = nokogiri_object2.xpath("//span[@class='price']").text.gsub!('$','').to_i
      posting_bedroom = nokogiri_object2.xpath("//span[@class='shared-line-bubble'][1]/b[1]").text.to_i
      posting_address = nokogiri_object2.xpath("//div[@class='mapaddress']").text
      posting_post_id = nokogiri_object2.xpath("//p[@class='postinginfo'][1]").text.gsub(/\D/, '').to_i
      posting_date_posted = nokogiri_object2.xpath("//time[@class='date timeago']").text.split(' ')[0]

      posting_options = []
      posting_optional_field1 = posting_options.push(nokogiri_object2.xpath("//p[@class='attrgroup'][2]/span[1]").text)
      posting_optional_field2 = posting_options.push(nokogiri_object2.xpath("//p[@class='attrgroup'][2]/span[2]").text)
      posting_optional_field3 = posting_options.push(nokogiri_object2.xpath("//p[@class='attrgroup'][2]/span[3]").text)
      posting_optional_field4 = posting_options.push(nokogiri_object2.xpath("//p[@class='attrgroup'][2]/span[4]").text)
      posting_optional_field5 = posting_options.push(nokogiri_object2.xpath("//p[@class='attrgroup'][2]/span[5]").text)
      posting_optional_field6 = posting_options.push(nokogiri_object2.xpath("//p[@class='attrgroup'][2]/span[6]").text)
      posting_optional_field7 = posting_options.push(nokogiri_object2.xpath("//p[@class='attrgroup'][2]/span[7]").text)
      posting_optional_field8 = posting_options.push(nokogiri_object2.xpath("//p[@class='attrgroup'][2]/span[8]").text)

      posting_housing_type = ""
      posting_wheelchair = posting_options.any? {|w| w == 'wheelchair accessible'}

      for i in posting_options
        if (i == "apartment" || i == "condo" || i == "cottage/cabin" || i == "duplex" || i == "flat" || i == "house" || i == "in-law" || i == "loft" || i == "townhouse" || i == "manufactured" || i == "assisted living" || i == "land")
          posting_housing_type = i
        end
      end

      # posting_email = nokogiri_object2.xpath("//a[@class='mailapp']")
      # posting_phone = nokogiri_object2.xpath("//p[@class='reply-tel-number']")

      Posting.create!(posting_link: link,
                      posting_bedroom: posting_bedroom,
                      posting_address: posting_address,
                      posting_date_posted: posting_date_posted,
                      posting_post_id: posting_post_id,
                      posting_price: posting_price,
                      # Still need to be grabbed
                      posting_body: "No HUD/Vouchers",
                      # posting_email: "placeholder@gmail.com",
                      # posting_phone: "(123) 456-789",
                      posting_housing_type: posting_housing_type,
                      posting_wheelchair: posting_wheelchair,
                      )
    end
  end
end
