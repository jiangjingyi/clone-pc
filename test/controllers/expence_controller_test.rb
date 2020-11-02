require 'test_helper'

class ExpenceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get expence_index_url
    assert_response :success
  end

end
