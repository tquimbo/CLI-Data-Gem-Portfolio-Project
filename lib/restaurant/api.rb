require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require 'pry'

class API

   def self.call(zip_code, cuisine)
      
      
      url = URI("https://documenu.p.rapidapi.com/restaurants/zip_code/#{zip_code}?size=20&cuisine=#{cuisine}")

      #this is a simplied API data
   #    url = URI("https://documenu.p.rapidapi.com/restaurants/zip_code/#{zip_code}?size=30&top_cuisines=true")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      
      request = Net::HTTP::Get.new(url)
      request["x-api-key"] = 'baf246c932f361ca5a5fda1f4c6cfbdc'
      request["x-rapidapi-key"] = 'bebaad4ee8mshe771f428751ab9ap18427ajsnb8ac89e572f8'
      request["x-rapidapi-host"] = 'documenu.p.rapidapi.com'
      
      response = http.request(request)
      puts response.read_body
      restaurant_data = JSON.parse(response.read_body)["data"]

      restaurant_data.each do |r|
         Restaurants.new(restaurant_name: r["restaurant_name"], restaurant_phone: r["restaurant_phone"], restaurant_website: r["restaurant_website"], hours: r["hours"], price_range: r["price_range"])
      end
   end   
   
end
