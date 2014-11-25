require 'test_helper'

class ImagesControllerTest < ActionController::TestCase
  test "cannot post images without signing up" do
  	@image = Image.create(id: 11, user_id: 1, filepicker_url: "some_url")
  	post(:create, image: {
  		user_id: @image.user_id,
  		filepicker_url: @image.filepicker_url
  	})
  	assert_response 302
  end
end
