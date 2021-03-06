namespace :scrape do
  desc "Scrapes craigslist at timed intervals."
  task :noko, [:city] => [:environment] do |t, args|
    coinToss = rand(1..2)
    puts "The coin toss result is #{coinToss}!"
    if coinToss.even?
      puts "scraping craigslist..."
      postings_portland = Posting.craigslist_scraper("https://#{args[:city]}.craigslist.org/search/apa?bundleDuplicates=1&availabilityMode=0")
      puts "scraping complete!"
    end
  end
end