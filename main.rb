require 'mechanize'
require 'open-uri'

WEBSITE_URL = "https://ouab.osu.edu/events.aspx"
# Instantiatea a new web scraper with Mechanize
scraper = Mechanize.new

# Limit HTML requests to prevent IP ban
scraper.history_added = Proc.new { sleep 0.5 }

# Instantiate a new web scraper with Mechanize
webpage = Nokogiri::HTML(open(WEBSITE_URL))

# Gather all list items with class attribute "confirmed" as a NodeSet
events_list = webpage.css("li[class=confirmed]")

# Print each item's text content and URL
events_list.each do |link|
  puts link.content
  puts link['id'] #TODO: Not working
end
