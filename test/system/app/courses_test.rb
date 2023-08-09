require "application_system_test_case"

class App::CoursesTest < ApplicationSystemTestCase
  setup do
    @app_course = app_courses(:one)
  end

  test "visiting the index" do
    visit app_courses_url
    assert_selector "h1", text: "Courses"
  end

  test "should create course" do
    visit app_courses_url
    click_on "New course"

    fill_in "App/client", with: @app_course.app/client_id
    fill_in "App/institution", with: @app_course.app/institution_id
    fill_in "Duration", with: @app_course.duration
    fill_in "Name", with: @app_course.name
    click_on "Create Course"

    assert_text "Course was successfully created"
    click_on "Back"
  end

  test "should update Course" do
    visit app_course_url(@app_course)
    click_on "Edit this course", match: :first

    fill_in "App/client", with: @app_course.app/client_id
    fill_in "App/institution", with: @app_course.app/institution_id
    fill_in "Duration", with: @app_course.duration
    fill_in "Name", with: @app_course.name
    click_on "Update Course"

    assert_text "Course was successfully updated"
    click_on "Back"
  end

  test "should destroy Course" do
    visit app_course_url(@app_course)
    click_on "Destroy this course", match: :first

    assert_text "Course was successfully destroyed"
  end
end
