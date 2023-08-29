require "test_helper"

class App::CitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @app_city = app_cities(:one)
  end

  test "should get index" do
    get app_cities_url
    assert_response :success
  end

  test "should get new" do
    get new_app_city_url
    assert_response :success
  end

  test "should create app_city" do
    assert_difference("App::City.count") do
      post app_cities_url, params: { app_city: { client_id: @app_city.client_id, name: @app_city.name, state: @app_city.state } }
    end

    assert_redirected_to app_city_url(App::City.last)
  end

  test "should show app_city" do
    get app_city_url(@app_city)
    assert_response :success
  end

  test "should get edit" do
    get edit_app_city_url(@app_city)
    assert_response :success
  end

  test "should update app_city" do
    patch app_city_url(@app_city), params: { app_city: { client_id: @app_city.client_id, name: @app_city.name, state: @app_city.state } }
    assert_redirected_to app_city_url(@app_city)
  end

  test "should destroy app_city" do
    assert_difference("App::City.count", -1) do
      delete app_city_url(@app_city)
    end

    assert_redirected_to app_cities_url
  end
end
