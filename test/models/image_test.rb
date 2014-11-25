require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  test "can create image" do
		assert_difference('Image.count') do
	    image = Image.create(id: 3, user_id: 1, filepicker_url: "null")
			image.save!
	  end
	end

	test "cannot create image without user_id" do
		image = Image.create(id: 4)
		assert_equal "can't be blank", image.errors[:user_id][0]
	end

	test "can update image url" do
		@image = Image.create(id: 4, user_id: 1, filepicker_url: "example_url1")
		old_url = @image.filepicker_url
		Image.find(4).update_attributes({ filepicker_url: "example_url2" })
		assert_not_equal old_url, Image.find(4).filepicker_url
	end
end
