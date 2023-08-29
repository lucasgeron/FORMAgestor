require "test_helper"

class App::UpdatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @app_update = app_updates(:one)
  end

  test "should get index" do
    get app_updates_url
    assert_response :success
  end

  test "should get new" do
    get new_app_update_url
    assert_response :success
  end

  test "should create app_update" do
    assert_difference("App::Update.count") do
      post app_updates_url, params: { app_update: { added_features: @app_update.added_features, bugs_fixed: @app_update.bugs_fixed, description: @app_update.description, release_date: @app_update.release_date, removed_features: @app_update.removed_features, version: @app_update.version } }
    end

    assert_redirected_to app_update_url(App::Update.last)
  end

  test "should show app_update" do
    get app_update_url(@app_update)
    assert_response :success
  end

  test "should get edit" do
    get edit_app_update_url(@app_update)
    assert_response :success
  end

  test "should update app_update" do
    patch app_update_url(@app_update), params: { app_update: { added_features: @app_update.added_features, bugs_fixed: @app_update.bugs_fixed, description: @app_update.description, release_date: @app_update.release_date, removed_features: @app_update.removed_features, version: @app_update.version } }
    assert_redirected_to app_update_url(@app_update)
  end

  test "should destroy app_update" do
    assert_difference("App::Update.count", -1) do
      delete app_update_url(@app_update)
    end

    assert_redirected_to app_updates_url
  end
end
