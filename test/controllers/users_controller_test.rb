require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "visit profile page" do
  	assert_routing '/profile', {controller: 'users', action: 'index'}
  end

end
