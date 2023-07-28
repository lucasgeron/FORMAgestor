require "test_helper"

class App::VendorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @app_vendor = app_vendors(:one)
  end

  test "should get index" do
    get app_vendors_url
    assert_response :success
  end

  test "should get new" do
    get new_app_vendor_url
    assert_response :success
  end

  test "should create app_vendor" do
    assert_difference("App::Vendor.count") do
      post app_vendors_url, params: { app_vendor: { email: @app_vendor.email, name: @app_vendor.name, phone: @app_vendor.phone, role: @app_vendor.role } }
    end

    assert_redirected_to app_vendor_url(App::Vendor.last)
  end

  test "should show app_vendor" do
    get app_vendor_url(@app_vendor)
    assert_response :success
  end

  test "should get edit" do
    get edit_app_vendor_url(@app_vendor)
    assert_response :success
  end

  test "should update app_vendor" do
    patch app_vendor_url(@app_vendor), params: { app_vendor: { email: @app_vendor.email, name: @app_vendor.name, phone: @app_vendor.phone, role: @app_vendor.role } }
    assert_redirected_to app_vendor_url(@app_vendor)
  end

  test "should destroy app_vendor" do
    assert_difference("App::Vendor.count", -1) do
      delete app_vendor_url(@app_vendor)
    end

    assert_redirected_to app_vendors_url
  end
end
