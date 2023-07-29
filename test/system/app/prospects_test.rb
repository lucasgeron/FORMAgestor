require "application_system_test_case"

class App::ProspectsTest < ApplicationSystemTestCase
  setup do
    @app_prospect = app_prospects(:one)
  end

  test "visiting the index" do
    visit app_prospects_url
    assert_selector "h1", text: "Prospects"
  end

  test "should create prospect" do
    visit app_prospects_url
    click_on "New prospect"

    fill_in "Ammount", with: @app_prospect.ammount
    fill_in "Channel", with: @app_prospect.channel
    fill_in "City", with: @app_prospect.city
    fill_in "Course", with: @app_prospect.course
    fill_in "Instagram", with: @app_prospect.instagram
    fill_in "Institution", with: @app_prospect.institution
    fill_in "Name", with: @app_prospect.name
    fill_in "Phone", with: @app_prospect.phone
    fill_in "Vendor", with: @app_prospect.vendor_id
    fill_in "Year graduation", with: @app_prospect.year_graduation
    click_on "Create Prospect"

    assert_text "Prospect was successfully created"
    click_on "Back"
  end

  test "should update Prospect" do
    visit app_prospect_url(@app_prospect)
    click_on "Edit this prospect", match: :first

    fill_in "Ammount", with: @app_prospect.ammount
    fill_in "Channel", with: @app_prospect.channel
    fill_in "City", with: @app_prospect.city
    fill_in "Course", with: @app_prospect.course
    fill_in "Instagram", with: @app_prospect.instagram
    fill_in "Institution", with: @app_prospect.institution
    fill_in "Name", with: @app_prospect.name
    fill_in "Phone", with: @app_prospect.phone
    fill_in "Vendor", with: @app_prospect.vendor_id
    fill_in "Year graduation", with: @app_prospect.year_graduation
    click_on "Update Prospect"

    assert_text "Prospect was successfully updated"
    click_on "Back"
  end

  test "should destroy Prospect" do
    visit app_prospect_url(@app_prospect)
    click_on "Destroy this prospect", match: :first

    assert_text "Prospect was successfully destroyed"
  end
end
