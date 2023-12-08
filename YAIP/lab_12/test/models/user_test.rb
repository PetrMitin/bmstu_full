require "test_helper"

class UserTest < ActiveSupport::TestCase

  test "should register a user" do
    user = User.new(email: "user_22@test.com", password: "password")
    assert user.save
  end

  test "should authenticate a user" do
    user = User.create(email: "user_33@test.com", password: "password")
    assert user.authenticate("password")
  end

end
