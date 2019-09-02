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
#p response.code #< "200", means good to go it works. A 404 would be a broken link., 500 would be issue with server.
#p response.message #< "OK"
#p response.headers #<gives you headers.
#Easy, right?


#Let's create a proper class to work with APIs
class StackExchange
  include HTTParty
  base_uri 'api.stackexchange.com'

  def initialize(service, page)
    @options = {query: {site: service}}

  end

  def questions
    self.class.get('/2.2/questions', @options)
  end

  def users
    self.class.get('/2.2/users', @options)
  end

end

stack_exchange = StackExchange.new('stackoverflow', 1)
# pp stack_exchange.questions


#Now how do we actually use this data?
class Resty
  include HTTParty
  base_uri ("edutechional-resty.herokuapp.com")

  def posts
    self.class.get('/posts.json') #use p here to see what it's calling.
  end

end

resty1 = Resty.new
#resty1.posts

#We get a hash back and we iterate through it.
resty1.posts.each do |post|
  p "Title: #{post["title"]} | Description:#{post["description"]}"
  #If you had a rails application, you could put this info directly into your database:
  #Post.create(title: post["title"], description: post["description"])
end