require "application_system_test_case"

class App::RoleVendorsTest < ApplicationSystemTestCase
  setup do
    @app_role_vendor = app_role_vendors(:one)
  end

  test "visiting the index" do
    visit app_role_vendors_url
    assert_selector "h1", text: "Role vendors"
  end

  test "should create role vendor" do
    visit app_role_vendors_url
    click_on "New role vendor"

    check "Active" if @app_role_vendor.active
    fill_in "Client", with: @app_role_vendor.client_id
    fill_in "Name", with: @app_role_vendor.name
    click_on "Create Role vendor"

    assert_text "Role vendor was successfully created"
    click_on "Back"
  end

  test "should update Role vendor" do
    visit app_role_vendor_url(@app_role_vendor)
    click_on "Edit this role vendor", match: :first

    check "Active" if @app_role_vendor.active
    fill_in "Client", with: @app_role_vendor.client_id
    fill_in "Name", with: @app_role_vendor.name
    click_on "Update Role vendor"

    assert_text "Role vendor was successfully updated"
    click_on "Back"
  end

  test "should destroy Role vendor" do
    visit app_role_vendor_url(@app_role_vendor)
    click_on "Destroy this role vendor", match: :first

    assert_text "Role vendor was successfully destroyed"
  end
end
