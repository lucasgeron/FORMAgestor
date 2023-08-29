require "test_helper"

class App::CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @app_course = app_courses(:one)
  end

  test "should get index" do
    get app_courses_url
    assert_response :success
  end

  test "should get new" do
    get new_app_course_url
    assert_response :success
  end

  test "should create app_course" do
    assert_difference("App::Course.count") do
      post app_courses_url, params: { app_course: { app/client_id: @app_course.app/client_id, app/institution_id: @app_course.app/institution_id, duration: @app_course.duration, name: @app_course.name } }
    end

    assert_redirected_to app_course_url(App::Course.last)
  end

  test "should show app_course" do
    get app_course_url(@app_course)
    assert_response :success
  end

  test "should get edit" do
    get edit_app_course_url(@app_course)
    assert_response :success
  end

  test "should update app_course" do
    patch app_course_url(@app_course), params: { app_course: { app/client_id: @app_course.app/client_id, app/institution_id: @app_course.app/institution_id, duration: @app_course.duration, name: @app_course.name } }
    assert_redirected_to app_course_url(@app_course)
  end

  test "should destroy app_course" do
    assert_difference("App::Course.count", -1) do
      delete app_course_url(@app_course)
    end

    assert_redirected_to app_courses_url
  end
end
