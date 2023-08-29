require "application_system_test_case"

class App::UpdatesTest < ApplicationSystemTestCase
  setup do
    @app_update = app_updates(:one)
  end

  test "visiting the index" do
    visit app_updates_url
    assert_selector "h1", text: "Updates"
  end

  test "should create update" do
    visit app_updates_url
    click_on "New update"

    fill_in "Added features", with: @app_update.added_features
    fill_in "Bugs fixed", with: @app_update.bugs_fixed
    fill_in "Description", with: @app_update.description
    fill_in "Release date", with: @app_update.release_date
    fill_in "Removed features", with: @app_update.removed_features
    fill_in "Version", with: @app_update.version
    click_on "Create Update"

    assert_text "Update was successfully created"
    click_on "Back"
  end

  test "should update Update" do
    visit app_update_url(@app_update)
    click_on "Edit this update", match: :first

    fill_in "Added features", with: @app_update.added_features
    fill_in "Bugs fixed", with: @app_update.bugs_fixed
    fill_in "Description", with: @app_update.description
    fill_in "Release date", with: @app_update.release_date
    fill_in "Removed features", with: @app_update.removed_features
    fill_in "Version", with: @app_update.version
    click_on "Update Update"

    assert_text "Update was successfully updated"
    click_on "Back"
  end

  test "should destroy Update" do
    visit app_update_url(@app_update)
    click_on "Destroy this update", match: :first

    assert_text "Update was successfully destroyed"
  end
end
