require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should create user" do
    user = User.create(:name => "user", :username => "user", :password => "user")
    current = User.select(:username => "user")
    assert current.exists?
  end
end
