#Interacting with APIs
#
require 'rubygems'
require 'httparty'

class Resty
  include HTTParty
  base_uri ("edutechional-resty.herokuapp.com")

  def posts
    self.class.get('/posts.json') #use p here to see what it's calling.
  end

end

#resty1 = Resty.new
#puts resty1.posts



#Let's make our code more efficient with Httparty
response = HTTParty.get('https://api.stackexchange.com/2.2/questions?site=stackoverflow')
#pp response
p response.code #< "200", means good to go it works. A 404 would be a broken link., 500 would be issue with server.
p response.message #< "OK"
p response.headers #<gives you headers.
#Easy, right?


