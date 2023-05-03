require "test_helper"

class ServicemenControllerTest < ActionDispatch::IntegrationTest
  setup do
    @serviceman = servicemen(:one)
  end

  test "should get index" do
    get servicemen_url
    assert_response :success
  end

  test "should get new" do
    get new_serviceman_url
    assert_response :success
  end

  test "should create serviceman" do
    assert_difference("Serviceman.count") do
      post servicemen_url, params: { serviceman: { category: @serviceman.category, name: @serviceman.name, surname: @serviceman.surname } }
    end

    assert_redirected_to serviceman_url(Serviceman.last)
  end

  test "should show serviceman" do
    get serviceman_url(@serviceman)
    assert_response :success
  end

  test "should get edit" do
    get edit_serviceman_url(@serviceman)
    assert_response :success
  end

  test "should update serviceman" do
    patch serviceman_url(@serviceman), params: { serviceman: { category: @serviceman.category, name: @serviceman.name, surname: @serviceman.surname } }
    assert_redirected_to serviceman_url(@serviceman)
  end

  test "should destroy serviceman" do
    assert_difference("Serviceman.count", -1) do
      delete serviceman_url(@serviceman)
    end

    assert_redirected_to servicemen_url
  end
end
