require "application_system_test_case"

class App::SubscribersTest < ApplicationSystemTestCase
  setup do
    @app_subscriber = app_subscribers(:one)
  end

  test "visiting the index" do
    visit app_subscribers_url
    assert_selector "h1", text: "Subscribers"
  end

  test "should create subscriber" do
    visit app_subscribers_url
    click_on "New subscriber"

    click_on "Create Subscriber"

    assert_text "Subscriber was successfully created"
    click_on "Back"
  end

  test "should update Subscriber" do
    visit app_subscriber_url(@app_subscriber)
    click_on "Edit this subscriber", match: :first

    click_on "Update Subscriber"

    assert_text "Subscriber was successfully updated"
    click_on "Back"
  end

  test "should destroy Subscriber" do
    visit app_subscriber_url(@app_subscriber)
    click_on "Destroy this subscriber", match: :first

    assert_text "Subscriber was successfully destroyed"
  end
end
