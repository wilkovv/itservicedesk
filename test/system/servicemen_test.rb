require "application_system_test_case"

class ServicemenTest < ApplicationSystemTestCase
  setup do
    @serviceman = servicemen(:one)
  end

  test "visiting the index" do
    visit servicemen_url
    assert_selector "h1", text: "Servicemen"
  end

  test "should create serviceman" do
    visit servicemen_url
    click_on "New serviceman"

    fill_in "Category", with: @serviceman.category
    fill_in "Name", with: @serviceman.name
    fill_in "Surname", with: @serviceman.surname
    click_on "Create Serviceman"

    assert_text "Serviceman was successfully created"
    click_on "Back"
  end

  test "should update Serviceman" do
    visit serviceman_url(@serviceman)
    click_on "Edit this serviceman", match: :first

    fill_in "Category", with: @serviceman.category
    fill_in "Name", with: @serviceman.name
    fill_in "Surname", with: @serviceman.surname
    click_on "Update Serviceman"

    assert_text "Serviceman was successfully updated"
    click_on "Back"
  end

  test "should destroy Serviceman" do
    visit serviceman_url(@serviceman)
    click_on "Destroy this serviceman", match: :first

    assert_text "Serviceman was successfully destroyed"
  end
end
