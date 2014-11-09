require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "can create user" do
		assert_difference('User.count') do
	    user = User.create(id: 3, name: "john", password: "password", email: "john@gmail.com")
			user.save!
	  end
	end

	test "cannot create user without name" do
		user = User.create(id: 3)
		assert_equal "can't be blank", user.errors[:name][0]
	end

	test "cannot create user without password" do
		user = User.create(id: 3, name: "billy")
		assert_equal "can't be blank", user.errors[:password_digest][0]
	end

	test "cannot create user with duplicate name" do
		user = User.create(id: 3, name: "Joe")
		assert_equal "has already been taken", user.errors[:name][0]
	end

	test "cannot create user with duplicate email" do
		user = User.create(id: 3, name: "Jo", email: "joe@gmail.com" )
		assert_equal "has already been taken", user.errors[:email][0]
	end
end
