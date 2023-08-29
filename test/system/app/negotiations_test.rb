require "application_system_test_case"

class App::NegotiationsTest < ApplicationSystemTestCase
  setup do
    @app_negotiation = app_negotiations(:one)
  end

  test "visiting the index" do
    visit app_negotiations_url
    assert_selector "h1", text: "Negotiations"
  end

  test "should create negotiation" do
    visit app_negotiations_url
    click_on "New negotiation"

    check "Active" if @app_negotiation.active
    fill_in "Calendar", with: @app_negotiation.calendar_id
    fill_in "Company", with: @app_negotiation.company_id
    fill_in "Course", with: @app_negotiation.course_id
    fill_in "Reference", with: @app_negotiation.reference
    fill_in "Status", with: @app_negotiation.status_id
    fill_in "Vendor", with: @app_negotiation.vendor_id
    click_on "Create Negotiation"

    assert_text "Negotiation was successfully created"
    click_on "Back"
  end

  test "should update Negotiation" do
    visit app_negotiation_url(@app_negotiation)
    click_on "Edit this negotiation", match: :first

    check "Active" if @app_negotiation.active
    fill_in "Calendar", with: @app_negotiation.calendar_id
    fill_in "Company", with: @app_negotiation.company_id
    fill_in "Course", with: @app_negotiation.course_id
    fill_in "Reference", with: @app_negotiation.reference
    fill_in "Status", with: @app_negotiation.status_id
    fill_in "Vendor", with: @app_negotiation.vendor_id
    click_on "Update Negotiation"

    assert_text "Negotiation was successfully updated"
    click_on "Back"
  end

  test "should destroy Negotiation" do
    visit app_negotiation_url(@app_negotiation)
    click_on "Destroy this negotiation", match: :first

    assert_text "Negotiation was successfully destroyed"
  end
end
