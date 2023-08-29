require "test_helper"

class App::CalendarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @app_calendar = app_calendars(:one)
  end

  test "should get index" do
    get app_calendars_url
    assert_response :success
  end

  test "should get new" do
    get new_app_calendar_url
    assert_response :success
  end

  test "should create app_calendar" do
    assert_difference("App::Calendar.count") do
      post app_calendars_url, params: { app_calendar: { active: @app_calendar.active, client_id: @app_calendar.client_id, semester: @app_calendar.semester, year: @app_calendar.year } }
    end

    assert_redirected_to app_calendar_url(App::Calendar.last)
  end

  test "should show app_calendar" do
    get app_calendar_url(@app_calendar)
    assert_response :success
  end

  test "should get edit" do
    get edit_app_calendar_url(@app_calendar)
    assert_response :success
  end

  test "should update app_calendar" do
    patch app_calendar_url(@app_calendar), params: { app_calendar: { active: @app_calendar.active, client_id: @app_calendar.client_id, semester: @app_calendar.semester, year: @app_calendar.year } }
    assert_redirected_to app_calendar_url(@app_calendar)
  end

  test "should destroy app_calendar" do
    assert_difference("App::Calendar.count", -1) do
      delete app_calendar_url(@app_calendar)
    end

    assert_redirected_to app_calendars_url
  end
end
