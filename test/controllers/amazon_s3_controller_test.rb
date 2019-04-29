require 'test_helper'

class AmazonS3ControllerTest < ActionDispatch::IntegrationTest
  test "should get upload" do
    get amazon_s3_upload_url
    assert_response :success
  end

end
