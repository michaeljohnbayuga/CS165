require 'test_helper'

class ShowsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "visit shows page" do
  	assert_routing '/shows', {controller: 'shows', action: 'index'}
  end
end
