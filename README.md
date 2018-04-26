
# HUD Crawler

##### Final capstone project exploring Ruby on Rails, regular expressions, and web crawling, 12.18.2017

##### By Riki Montgomery

### Description

The purpose of this project is to build an income source discrimination tracker to target localities in the states of Oregon and Washington, in order to advance legislation and legal recourse for low-income communities that are negatively affected. As of 2016 there were [42 jurisdictions](https://affordablehousingonline.com/source-of-income-antidiscrimination-laws) in the United States that prohibit discrimination against Section 8 Housing Choice Voucher holders. This application will be used as a proof of concept for non-profit legal aid providers in Oregon and [Oregon housing authorities](https://www.orhousingauthorities.org/) to assist those localities in the fight against income source discrimination. It has the added potential to help regulators, senators, city counselors, and members of congress advance legislation nationwide. It could also help activists make a case to affect change at a grassroots level by demonstrating the impact that this type of discrimination has on housing supply for low-income individuals while our cities struggle to address the housing crisis.

[[​​Oregon's Voucher Non-Discrimination Law Explained](/Users/Guest/Desktop/hud_crawler/app/assets/images/non_discrimination_video_link.png)](https://www.youtube.com/watch?time_continue=24&v=tGk9HhSTrbQ)

### Examples of Discrimination

[Example 1](https://portland.craigslist.org/mlt/apa/d/fair-acres-apartments-2bd/6569475578.html)
[Example 2](https://portland.craigslist.org/mlt/apa/d/darling-2-bedrooms-with/6559561071.html)
[Example 3](https://corvallis.craigslist.org/apa/d/3-bed-1-bath-country-mother/6559692412.html)

### Task List

- [x] Create a rake task that scrapes at irregular intervals.

- [] Integrate pagination with the Kaminari Gem or Will_Paginate Gem

- [] Create a function to check and remove duplicates.

- [] Write more tests(!!!)!

- [] Write regex to target instances of discrimination using the levenshtein distance algorithm.

- [] Integrate Mechanize to click through CL pages.

### Further Exploration

- [] Compare cities, states, and counties with anti-income source discrimination laws against those without.

- [] Collect data from Connecticut, the District of Columbia, Maine, Massachusetts, New Jersey, North Dakota, Oklahoma, Vermont, and any other state with anti-discrimination laws.

- [] Create a form to collect data from other localities for grassroots organizers and legislators in those areas to affect change in those areas.

- [] Make the project open source.

- [] Google Maps API


### Technologies Used

* HTML
* CSS
* Materialize
* Ruby on Rails
* Heroku
* PostgreSQL

### Gems Used

* nokogiri
* devise
* geokit or area
* mechanize



### Database Initialization

1. Run `$ bundle update` then `$ bundle install` or just `$ bundle` to install the Gemfile.
2. Run `$ rake db:create` to create the databases.
3. Run `$ rake db:migrate`, and `$ rake db:test:prepare` prepare the test database.

### Deployment instructions

Make sure you have postgres running, then run `$ rails serve` and got to [localhost:3000](localhost:3000) in your favorite browser.

### Additional Information

Ruby Programming Language on Github: [https://github.com/ruby/ruby](https://github.com/ruby/ruby)

Ruby Language homepage: [https://www.ruby-lang.org/en/](https://www.ruby-lang.org/en/)

Ruby Documentation: [http://ruby-doc.org/](http://ruby-doc.org/)

Rails Documentation: [http://guides.rubyonrails.org/](http://guides.rubyonrails.org/)

Ruby on Rails API: [http://api.rubyonrails.org/](http://api.rubyonrails.org/)

Rails on Github: [https://github.com/rails/rails](https://github.com/rails/rails)

### Support and contact details

If you have any questions or comments please make a contribution to my repository or [email](mostriki820@gmail.com) me directly.

### License
© 2017 Riki Montgomery
