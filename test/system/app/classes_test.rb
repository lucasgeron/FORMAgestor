require "application_system_test_case"

class App::ClassesTest < ApplicationSystemTestCase
  setup do
    @app_class = app_classes(:one)
  end

  test "visiting the index" do
    visit app_classes_url
    assert_selector "h1", text: "Classes"
  end

  test "should create class" do
    visit app_classes_url
    click_on "New class"

    click_on "Create Class"

    assert_text "Class was successfully created"
    click_on "Back"
  end

  test "should update Class" do
    visit app_class_url(@app_class)
    click_on "Edit this class", match: :first

    click_on "Update Class"

    assert_text "Class was successfully updated"
    click_on "Back"
  end

  test "should destroy Class" do
    visit app_class_url(@app_class)
    click_on "Destroy this class", match: :first

    assert_text "Class was successfully destroyed"
  end
end
