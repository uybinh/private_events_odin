require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Binh Phan", email: "binh@gmail.com",
                                      password: "foobar",
                                      password_confirmation: "foobar")
  end

  test "should be valid" do

  end
end
