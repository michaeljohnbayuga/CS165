require 'test_helper'

class TrackersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  test "visit tracker page" do
  	assert_routing '/trackers', {controller: 'trackers', action: 'index'}
  end
end
