require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  test "can create image" do
		assert_difference('Image.count') do
	    image = Image.create(id: 3, user_id: 1, filepicker_url: "null")
			image.save!
	  end
	end

	test "cannot create image without user_id" do
		image = Image.create(id: 3)
		assert_equal "can't be blank", image.errors[:user_id][0]
	end
end
