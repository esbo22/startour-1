require 'test_helper'

class Owner::ShipsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get owner_ships_index_url
    assert_response :success
  end

end
