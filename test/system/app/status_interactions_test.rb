require "application_system_test_case"

class App::StatusInteractionsTest < ApplicationSystemTestCase
  setup do
    @app_status_interaction = app_status_interactions(:one)
  end

  test "visiting the index" do
    visit app_status_interactions_url
    assert_selector "h1", text: "Status interactions"
  end

  test "should create status interaction" do
    visit app_status_interactions_url
    click_on "New status interaction"

    check "Active" if @app_status_interaction.active
    fill_in "Client", with: @app_status_interaction.client_id
    fill_in "Color", with: @app_status_interaction.color
    fill_in "Icon", with: @app_status_interaction.icon
    fill_in "Name", with: @app_status_interaction.name
    fill_in "Style", with: @app_status_interaction.style
    click_on "Create Status interaction"

    assert_text "Status interaction was successfully created"
    click_on "Back"
  end

  test "should update Status interaction" do
    visit app_status_interaction_url(@app_status_interaction)
    click_on "Edit this status interaction", match: :first

    check "Active" if @app_status_interaction.active
    fill_in "Client", with: @app_status_interaction.client_id
    fill_in "Color", with: @app_status_interaction.color
    fill_in "Icon", with: @app_status_interaction.icon
    fill_in "Name", with: @app_status_interaction.name
    fill_in "Style", with: @app_status_interaction.style
    click_on "Update Status interaction"

    assert_text "Status interaction was successfully updated"
    click_on "Back"
  end

  test "should destroy Status interaction" do
    visit app_status_interaction_url(@app_status_interaction)
    click_on "Destroy this status interaction", match: :first

    assert_text "Status interaction was successfully destroyed"
  end
end
