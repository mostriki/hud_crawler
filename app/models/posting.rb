class Posting < ApplicationRecord
  require 'open-uri'

  # validates :posting_link, :presence => true
  # validates :posting_body, :presence => true
  # validates :posting_price, :presence => true
  # validates :posting_bedroom, :presence => true
  # validates :posting_address, :presence => true
  # validates :posting_housing_type, :presence => true
  # validates :posting_date_posted, :presence => true
  # validates :posting_post_id, :presence => true
  # validates :posting_wheelchair, :presence => true

  def self.craigslist_scraper(url)
    nokogiri_object = Nokogiri::HTML(open(url).read)
    posting_link = nokogiri_object.xpath("//a[@class='result-title hdrlnk']/@href")

    posting_link.each do |link|
      nokogiri_object2 = Nokogiri::HTML(open(link).read)
      new_posting = { posting_link: link }
      
      new_posting[:posting_body] = "No HUD/Vouchers" 
      new_posting[:posting_price] = nokogiri_object2.xpath("//span[@class='price']").text.gsub!('$','').to_i
      new_posting[:posting_bedroom] = nokogiri_object2.xpath("//span[@class='shared-line-bubble'][1]/b[1]").text.to_i
      new_posting[:posting_address] = nokogiri_object2.xpath("//div[@class='mapaddress']").text
      new_posting[:posting_post_id] = nokogiri_object2.xpath("//p[@class='postinginfo'][1]").text.gsub(/\D/, '').to_i
      new_posting[:posting_date_posted] = nokogiri_object2.xpath("//time[@class='date timeago']").text.split(' ')[0]

      posting_options = []
      1.upto(8).each do |span_number|
        posting_options.push(nokogiri_object2.xpath("//p[@class='attrgroup'][2]/span[#{span_number}]").text)
      end

      valid_options = { "apartment" => true, 
        "condo" => true, 
        "cottage/cabin" => true, 
        "duplex" => true, 
        "flat" => true, 
        "house" => true, 
        "in-law" => true, 
        "loft" => true, 
        "townhouse" => true, 
        "manufactured" => true, 
        "assisted living" => true, 
        "land" => true 
      }

      new_posting[:posting_housing_type] = posting_options.select{ |element| valid_options.include?(element) }.join('')
      new_posting[:posting_wheelchair] = posting_options.any? {|w| w == 'wheelchair accessible'}

      Posting.create!(new_posting)
    end
  end
end
