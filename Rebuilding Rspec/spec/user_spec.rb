require_relative '../runner'
require 'sequel'
require 'pry'
Sequel.connect 'postgres://localhost/tests'

class User < Sequel::Model(:users)
  def change_email(email)
    update(email: email)
  end
end

describe User do
  def user
    # Notice that we're memoizing to increase speed!
    # This is basically what 'let' does in RSpec
    @user ||= User.create(email: 'alice@example.com', last_login: Time.new(2015, 10, 21, 10, 22))
  end

  # it 'has an email address' do
  #   user.email.should == 'alice@example.com'
  # end
  #
  # it 'has a last login time' do
  #   user.last_login.should == Time.new(2015, 10, 21, 10, 22)
  # end

  # Let's collapse above into a single test.
  it 'has some attributes' do
    # Yes, you usually do 1 assertion per test. But that's okay to break here. It's not RIGID.
    user.email.should == 'alice@example.com'
    user.last_login.should == Time.new(2015, 10, 21, 10, 22)
  end

  it 'can change emails' do
    # When you're changing something in a test, you want a single assertion.
    user.change_email('bob@example.com')
    user.email.should == 'bob@example.com'
  end
end