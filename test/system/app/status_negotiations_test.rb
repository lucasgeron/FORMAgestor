require "application_system_test_case"

class App::StatusNegotiationsTest < ApplicationSystemTestCase
  setup do
    @app_status_negotiation = app_status_negotiations(:one)
  end

  test "visiting the index" do
    visit app_status_negotiations_url
    assert_selector "h1", text: "Status negotiations"
  end

  test "should create status negotiation" do
    visit app_status_negotiations_url
    click_on "New status negotiation"

    check "Active" if @app_status_negotiation.active
    fill_in "Client", with: @app_status_negotiation.client_id
    fill_in "Color", with: @app_status_negotiation.color
    fill_in "Icon", with: @app_status_negotiation.icon
    fill_in "Icon style", with: @app_status_negotiation.icon_style
    fill_in "Name", with: @app_status_negotiation.name
    click_on "Create Status negotiation"

    assert_text "Status negotiation was successfully created"
    click_on "Back"
  end

  test "should update Status negotiation" do
    visit app_status_negotiation_url(@app_status_negotiation)
    click_on "Edit this status negotiation", match: :first

    check "Active" if @app_status_negotiation.active
    fill_in "Client", with: @app_status_negotiation.client_id
    fill_in "Color", with: @app_status_negotiation.color
    fill_in "Icon", with: @app_status_negotiation.icon
    fill_in "Icon style", with: @app_status_negotiation.icon_style
    fill_in "Name", with: @app_status_negotiation.name
    click_on "Update Status negotiation"

    assert_text "Status negotiation was successfully updated"
    click_on "Back"
  end

  test "should destroy Status negotiation" do
    visit app_status_negotiation_url(@app_status_negotiation)
    click_on "Destroy this status negotiation", match: :first

    assert_text "Status negotiation was successfully destroyed"
  end
end
