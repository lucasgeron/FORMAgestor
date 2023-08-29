require "test_helper"

class App::RoleVendorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @app_role_vendor = app_role_vendors(:one)
  end

  test "should get index" do
    get app_role_vendors_url
    assert_response :success
  end

  test "should get new" do
    get new_app_role_vendor_url
    assert_response :success
  end

  test "should create app_role_vendor" do
    assert_difference("App::RoleVendor.count") do
      post app_role_vendors_url, params: { app_role_vendor: { active: @app_role_vendor.active, client_id: @app_role_vendor.client_id, name: @app_role_vendor.name } }
    end

    assert_redirected_to app_role_vendor_url(App::RoleVendor.last)
  end

  test "should show app_role_vendor" do
    get app_role_vendor_url(@app_role_vendor)
    assert_response :success
  end

  test "should get edit" do
    get edit_app_role_vendor_url(@app_role_vendor)
    assert_response :success
  end

  test "should update app_role_vendor" do
    patch app_role_vendor_url(@app_role_vendor), params: { app_role_vendor: { active: @app_role_vendor.active, client_id: @app_role_vendor.client_id, name: @app_role_vendor.name } }
    assert_redirected_to app_role_vendor_url(@app_role_vendor)
  end

  test "should destroy app_role_vendor" do
    assert_difference("App::RoleVendor.count", -1) do
      delete app_role_vendor_url(@app_role_vendor)
    end

    assert_redirected_to app_role_vendors_url
  end
end
