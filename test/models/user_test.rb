require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "is not valid without a first name" do
    user = User.new(last_name: "Holmes", email: "holmes@holmes.com", password: "123456", date_of_birth: Date.new(1900,5,1))
    assert_not user.save, "Saved without first name."
  end

  test "is not valid without a last name" do
    user = User.new(first_name: "Allan", email: "holmes@holmes.com", password: "123456", date_of_birth: Date.new(1900,5,1))
    assert_not user.save, "Saved without last name."
  end

  test "is not valid without a birthday" do
    user = User.new(first_name: "Allan", last_name: "Holmes", email: "holmes@holmes.com", password: "123456")
    assert_not user.save, "Saved without birthday."
  end

  test "is not valid if not 18 or older" do
    user = User.new(first_name: "Allan", last_name: "Holmes", email: "holmes@holmes.com", password: "123456", date_of_birth: Date.new(2018,5,1))
    assert_not user.save, "Saved under 18."
  end

  test "does not save users with invalid email addresses" do
    allan = User.new(first_name: "Allan", last_name: "Holmes", email: "holmes@holmes", password: "123456", date_of_birth: Date.new(1900,5,1))
    thomas = User.new(first_name: "Thomas", last_name: "GeniusBoy", email: "thomas.genius.com", password: "123456", date_of_birth: Date.new(1900,5,1))
    thilo = User.new(first_name: "Thilo", last_name: "BirthdayBoy", email: "thilocamper``", password: "123456", date_of_birth: Date.new(1900,5,1))
    assert_not allan.save, "allan saved with invalid email address"
    assert_not thomas.save, "thomas saved with invalid email address"
    assert_not thilo.save, "thilo saved with invalid email address"
  end

end
