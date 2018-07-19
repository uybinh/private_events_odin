require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @user = User.create!(name: "Binh Phan", email: "other@gmail.com",
      password: "foobar",
      password_confirmation: "foobar")
    @event = @user.created_events.build(date: Time.zone.tomorrow, location: "My house")
  end

  test "should be valid" do
    assert @event.valid?
  end

  test "#creator method should work" do
    @user = users(:uybinh)
    @event = events(:one)
    assert_equal @event.creator, @user
  end
end
