#Let's emulate a rails app here.

#Build a session with a hash. Simple session. We're logged in.

def session_id
  1
end

class User
  def initialize(name = nil, email = nil)
    @name = name
    @email = email
  end

  def name
    "nikita"
  end

  def email
    "nk@gmail.com"
  end

  def self.find(id)
    case id
    when 1
      User.new("Nikita", "nik@gmail.com")
    end
  end
end

p User.find(1) #<User:0x007fa67e0ff308 @name="Nikita", @email="nik@gmail.com">
p User.find(2) #nil

def current_user
  if session_id
     User.find(session_id)
  end
end

p current_user #<User:0x007ff497062eb0 @name="Nikita", @email="nik@gmail.com">

#Well, if it doesn't find the current user, let's handle that by putting it into GuestUser

class GuestUser
  def initialize(session)
    @session = session
  end

  def name
    "Guest"
  end
end


def current_user
  if session_id == 5
    User.find(session_id)
  else
    GuestUser.new(session_id)
  end
end

p current_user

def greet
  puts "Hello #{current_user.name}"
end

greet