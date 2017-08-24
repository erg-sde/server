require 'nokogiri'
require 'httparty'
require 'sinatra'

page = HTTParty.get('https://miami.craigslist.org/search/mdc/jjj')
parse_page = Nokogiri::HTML(page)
jobs_array = []
x = 1
parse_page.css('.hdrlnk').each do |item|
  jobs_array << x.to_s+". "+(item)+"\n"+ "https://miami.craigslist.org" + item.attributes["href"].value
  x += 1
end

get '/' do

  return jobs_array.join
end



get "/sinatra" do
  "Hello Sinatra"
end
