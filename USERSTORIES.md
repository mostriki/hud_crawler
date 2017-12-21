# User Stories


- [x] As a user I want to select a city and see a list of craigslist posts with relevant information.
- [x] As a user want to be able to click on a post's id and see a new tab open that directly links me to that post on craigslist.
- [ ] As a user I want to be able to read an about page detailing the purpose of this project.
- [ ] As a user I want to be able to check off each listing if I have contacted the poster.
- [ ] As a user I want to be able to mark a listing as a false positive.
- [ ] As a user I want to be able to see a count of all listings that are in violation of Oregon's non-discrimination law, their locations, and dates.
- [ ] As a user I want to be able to see the posters email and phone number so that I may contact them if necessary.
- [ ] As a user I want to be able to trigger the web scraper with the click of a button so that simply refreshing the page does not trigger it each time.
- [ ] As a user I want to be able to compare statistics from listings in different regions, states and localities.
- [x] As a user I want to be able to sign in to the application using secure authorization.
- [ ] As a user I don't want to see duplicate listing every time I scrape craigslist.
- [ ] As a user I don't want to see listings that are not in violation of Oregon's non-discrimination law.

### XPath Targets

- [ ] postings_link _.xpath("//a[@class='result-title hdrlnk']/@href")_
- [ ] posting_title _.xpath("//span[@id='titletextonly']").text_
- [ ] posting_location _.xpath("//span[@class='postingtitletext']/small").text_
- [x] posting_body _.xpath("//section[@id='postingbody']")_
- [ ] posting_square_feet _.xpath("//span[@class='shared-line-bubble'][2]").text.to_i_
- [x] posting_price _.xpath("//span[@class='price']").text.gsub!('$','').to_i_
- [ ] posting_availability _.xpath("//span[@class='housing_movein_now property_date shared-line-bubble attr_is_today']")_
- [x] posting_bedroom _.xpath("//span[@class='shared-line-bubble'][1]/b[1]").children.text.to_i_
- [ ] posting_bathrooms _.xpath("//span[@class='shared-line-bubble'][1]/b[2]").children.text.to_i_
- [x] posting_address _.xpath("//div[@class='mapaddress']").children.text_
- [x] posting_email _.xpath("//a[@class='mailapp']")_
- [x] posting_phone_number _.xpath("//p[@class='reply-tel-number']")_
- [x] posting_date_posted _.xpath("//time[@class='date timeago']").text.split(' ')[0]_
- [x] posting_post_id _.xpath("//p[@class='postinginfo'][1]")_

### XPath Targets for Amenities
- [x] posting_housing_type _(apartment, condo, cottage/cabin, duplex, flat, house, in-law, loft, townhouse, manufactured, assisted living, land)_
- [ ] posting_laundy _(w/d in unit, w/d hookups, laundry in bldg, laundry on site, no laundry on site)_
- [ ] posting_parking _(carport, attached garage, detached garage, off-street parking, street parking, valet parking, no)_ parking
- [ ] cats are OK - purrr
- [ ] dogs are OK - wooof
- [ ] furnished
- [ ] no smoking
- [x] wheelchair accessible

* posting_optional_field1 _.xpath("//p[@class='attrgroup'][2]/span[1]").text_
* posting_optional_field2 _.xpath("//p[@class='attrgroup'][2]/span[2]").text_
* posting_optional_field3 _.xpath("//p[@class='attrgroup'][2]/span[3]").text_
* posting_optional_field4 _.xpath("//p[@class='attrgroup'][2]/span[4]").text_
* posting_optional_field5 _.xpath("//p[@class='attrgroup'][2]/span[5]").text_
* posting_optional_field6 _.xpath("//p[@class='attrgroup'][2]/span[6]").text_
* posting_optional_field7 _.xpath("//p[@class='attrgroup'][2]/span[7]").text_
* posting_optional_field8 _.xpath("//p[@class='attrgroup'][2]/span[8]").text_

### XPath Targets for Open House Dates
- [ ] posting_open_house_date1 _.xpath("//p[@class='attrgroup'][2]/span[1]")_
- [ ] posting_open_house_date2 _.xpath("//p[@class='attrgroup'][2]/span[2]")_
- [ ] posting_open_house_date3 _.xpath("//p[@class='attrgroup'][2]/span[3]")_

### XPath Target Move in Date
- [ ] posting_move_in_date _.xpath("//span[@class='housing_movein_now property_date shared-line-bubble']")_
