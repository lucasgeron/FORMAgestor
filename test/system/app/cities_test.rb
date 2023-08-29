require "application_system_test_case"

class App::CitiesTest < ApplicationSystemTestCase
  setup do
    @app_city = app_cities(:one)
  end

  test "visiting the index" do
    visit app_cities_url
    assert_selector "h1", text: "Cities"
  end

  test "should create city" do
    visit app_cities_url
    click_on "New city"

    fill_in "Client", with: @app_city.client_id
    fill_in "Name", with: @app_city.name
    fill_in "State", with: @app_city.state
    click_on "Create City"

    assert_text "City was successfully created"
    click_on "Back"
  end

  test "should update City" do
    visit app_city_url(@app_city)
    click_on "Edit this city", match: :first

    fill_in "Client", with: @app_city.client_id
    fill_in "Name", with: @app_city.name
    fill_in "State", with: @app_city.state
    click_on "Update City"

    assert_text "City was successfully updated"
    click_on "Back"
  end

  test "should destroy City" do
    visit app_city_url(@app_city)
    click_on "Destroy this city", match: :first

    assert_text "City was successfully destroyed"
  end
end
