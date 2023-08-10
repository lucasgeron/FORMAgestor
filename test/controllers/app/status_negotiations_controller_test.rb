require "test_helper"

class App::StatusNegotiationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @app_status_negotiation = app_status_negotiations(:one)
  end

  test "should get index" do
    get app_status_negotiations_url
    assert_response :success
  end

  test "should get new" do
    get new_app_status_negotiation_url
    assert_response :success
  end

  test "should create app_status_negotiation" do
    assert_difference("App::StatusNegotiation.count") do
      post app_status_negotiations_url, params: { app_status_negotiation: { active: @app_status_negotiation.active, client_id: @app_status_negotiation.client_id, color: @app_status_negotiation.color, icon: @app_status_negotiation.icon, icon_style: @app_status_negotiation.icon_style, name: @app_status_negotiation.name } }
    end

    assert_redirected_to app_status_negotiation_url(App::StatusNegotiation.last)
  end

  test "should show app_status_negotiation" do
    get app_status_negotiation_url(@app_status_negotiation)
    assert_response :success
  end

  test "should get edit" do
    get edit_app_status_negotiation_url(@app_status_negotiation)
    assert_response :success
  end

  test "should update app_status_negotiation" do
    patch app_status_negotiation_url(@app_status_negotiation), params: { app_status_negotiation: { active: @app_status_negotiation.active, client_id: @app_status_negotiation.client_id, color: @app_status_negotiation.color, icon: @app_status_negotiation.icon, icon_style: @app_status_negotiation.icon_style, name: @app_status_negotiation.name } }
    assert_redirected_to app_status_negotiation_url(@app_status_negotiation)
  end

  test "should destroy app_status_negotiation" do
    assert_difference("App::StatusNegotiation.count", -1) do
      delete app_status_negotiation_url(@app_status_negotiation)
    end

    assert_redirected_to app_status_negotiations_url
  end
end
