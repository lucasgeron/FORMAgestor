require "test_helper"

class App::ClassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @app_class = app_classes(:one)
  end

  test "should get index" do
    get app_classes_url
    assert_response :success
  end

  test "should get new" do
    get new_app_class_url
    assert_response :success
  end

  test "should create app_class" do
    assert_difference("App::Class.count") do
      post app_classes_url, params: { app_class: {  } }
    end

    assert_redirected_to app_class_url(App::Class.last)
  end

  test "should show app_class" do
    get app_class_url(@app_class)
    assert_response :success
  end

  test "should get edit" do
    get edit_app_class_url(@app_class)
    assert_response :success
  end

  test "should update app_class" do
    patch app_class_url(@app_class), params: { app_class: {  } }
    assert_redirected_to app_class_url(@app_class)
  end

  test "should destroy app_class" do
    assert_difference("App::Class.count", -1) do
      delete app_class_url(@app_class)
    end

    assert_redirected_to app_classes_url
  end
end
