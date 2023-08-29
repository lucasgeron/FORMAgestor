require "test_helper"

class App::SubscribersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @app_subscriber = app_subscribers(:one)
  end

  test "should get index" do
    get app_subscribers_url
    assert_response :success
  end

  test "should get new" do
    get new_app_subscriber_url
    assert_response :success
  end

  test "should create app_subscriber" do
    assert_difference("App::Subscriber.count") do
      post app_subscribers_url, params: { app_subscriber: {  } }
    end

    assert_redirected_to app_subscriber_url(App::Subscriber.last)
  end

  test "should show app_subscriber" do
    get app_subscriber_url(@app_subscriber)
    assert_response :success
  end

  test "should get edit" do
    get edit_app_subscriber_url(@app_subscriber)
    assert_response :success
  end

  test "should update app_subscriber" do
    patch app_subscriber_url(@app_subscriber), params: { app_subscriber: {  } }
    assert_redirected_to app_subscriber_url(@app_subscriber)
  end

  test "should destroy app_subscriber" do
    assert_difference("App::Subscriber.count", -1) do
      delete app_subscriber_url(@app_subscriber)
    end

    assert_redirected_to app_subscribers_url
  end
end
