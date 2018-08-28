require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get business" do
    get categories_business_url
    assert_response :success
  end

  test "should get life" do
    get categories_life_url
    assert_response :success
  end

  test "should get planning" do
    get categories_planning_url
    assert_response :success
  end

  test "should get technology" do
    get categories_technology_url
    assert_response :success
  end

  test "should get art" do
    get categories_art_url
    assert_response :success
  end

  test "should get event" do
    get categories_event_url
    assert_response :success
  end

  test "should get hobby" do
    get categories_hobby_url
    assert_response :success
  end

end
