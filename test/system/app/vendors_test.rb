require "application_system_test_case"

class App::VendorsTest < ApplicationSystemTestCase
  setup do
    @app_vendor = app_vendors(:one)
  end

  test "visiting the index" do
    visit app_vendors_url
    assert_selector "h1", text: "Vendors"
  end

  test "should create vendor" do
    visit app_vendors_url
    click_on "New vendor"

    fill_in "Email", with: @app_vendor.email
    fill_in "Name", with: @app_vendor.name
    fill_in "Phone", with: @app_vendor.phone
    fill_in "Role", with: @app_vendor.role
    click_on "Create Vendor"

    assert_text "Vendor was successfully created"
    click_on "Back"
  end

  test "should update Vendor" do
    visit app_vendor_url(@app_vendor)
    click_on "Edit this vendor", match: :first

    fill_in "Email", with: @app_vendor.email
    fill_in "Name", with: @app_vendor.name
    fill_in "Phone", with: @app_vendor.phone
    fill_in "Role", with: @app_vendor.role
    click_on "Update Vendor"

    assert_text "Vendor was successfully updated"
    click_on "Back"
  end

  test "should destroy Vendor" do
    visit app_vendor_url(@app_vendor)
    click_on "Destroy this vendor", match: :first

    assert_text "Vendor was successfully destroyed"
  end
end
