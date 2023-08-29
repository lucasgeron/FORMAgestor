require "test_helper"

class App::NegotiationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @app_negotiation = app_negotiations(:one)
  end

  test "should get index" do
    get app_negotiations_url
    assert_response :success
  end

  test "should get new" do
    get new_app_negotiation_url
    assert_response :success
  end

  test "should create app_negotiation" do
    assert_difference("App::Negotiation.count") do
      post app_negotiations_url, params: { app_negotiation: { active: @app_negotiation.active, calendar_id: @app_negotiation.calendar_id, company_id: @app_negotiation.company_id, course_id: @app_negotiation.course_id, reference: @app_negotiation.reference, status_id: @app_negotiation.status_id, vendor_id: @app_negotiation.vendor_id } }
    end

    assert_redirected_to app_negotiation_url(App::Negotiation.last)
  end

  test "should show app_negotiation" do
    get app_negotiation_url(@app_negotiation)
    assert_response :success
  end

  test "should get edit" do
    get edit_app_negotiation_url(@app_negotiation)
    assert_response :success
  end

  test "should update app_negotiation" do
    patch app_negotiation_url(@app_negotiation), params: { app_negotiation: { active: @app_negotiation.active, calendar_id: @app_negotiation.calendar_id, company_id: @app_negotiation.company_id, course_id: @app_negotiation.course_id, reference: @app_negotiation.reference, status_id: @app_negotiation.status_id, vendor_id: @app_negotiation.vendor_id } }
    assert_redirected_to app_negotiation_url(@app_negotiation)
  end

  test "should destroy app_negotiation" do
    assert_difference("App::Negotiation.count", -1) do
      delete app_negotiation_url(@app_negotiation)
    end

    assert_redirected_to app_negotiations_url
  end
end
