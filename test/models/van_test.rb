require 'test_helper'

class VanTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "does not save without a valid title (min length 4)" do
    van = Van.new(title: " ", description: "This van has no name.", brand: "Volvo", category: "For great camping", seats: 6)
    assert_not van.save, "Saved with empty title"
  end

  test "does not save without a valid description (min length 10)" do
    van1 = Van.new(title: "Bobby", description: "Hi", brand: "Volvo", category: "For great camping", seats: 6)
    van2 = Van.new(title: "Bobby", brand: "Volvo", category: "For great camping", seats: 6)
    assert_not van1.save, "Saved with shitty description"
    assert_not van2.save, "Saved with no description"
  end

  test "does not save without a brand" do
    van = Van.new(title: "Bobby", description: "Hi", category: "For great camping", seats: 6)
    assert_not van.save, "Saved without brand"
  end

  test "does not save without a category" do
    van = Van.new(title: "Bobby", description: "Hi", brand: "Maserati", seats: 6)
    assert_not van.save, "Saved without description"
  end

  test "does not save without a valid number of seats (0-30)" do
    van1 = Van.new(title: "Bobby", description: "Hi", brand: "Ferrari", category: "For great camping", seats: -1)
    van2 = Van.new(title: "Bobby", description: "Hi", brand: "Ferrari", category: "For great camping", seats: 32)
    van3 = Van.new(title: "Bobby", description: "Hi", brand: "Ferrari", category: "For great camping")
    assert_not van1.save, "Saved with negative seats"
    assert_not van2.save, "Saved with too many seats"
    assert_not van3.save, "Saved with no seats attribuet"
  end
end


