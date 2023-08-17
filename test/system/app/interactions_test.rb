require "application_system_test_case"

class App::InteractionsTest < ApplicationSystemTestCase
  setup do
    @app_interaction = app_interactions(:one)
  end

  test "visiting the index" do
    visit app_interactions_url
    assert_selector "h1", text: "Interactions"
  end

  test "should create interaction" do
    visit app_interactions_url
    click_on "New interaction"

    fill_in "Client", with: @app_interaction.client_id
    fill_in "Description", with: @app_interaction.description
    fill_in "Negotiation", with: @app_interaction.negotiation_id
    fill_in "Status", with: @app_interaction.status_id
    fill_in "Vendor", with: @app_interaction.vendor_id
    click_on "Create Interaction"

    assert_text "Interaction was successfully created"
    click_on "Back"
  end

  test "should update Interaction" do
    visit app_interaction_url(@app_interaction)
    click_on "Edit this interaction", match: :first

    fill_in "Client", with: @app_interaction.client_id
    fill_in "Description", with: @app_interaction.description
    fill_in "Negotiation", with: @app_interaction.negotiation_id
    fill_in "Status", with: @app_interaction.status_id
    fill_in "Vendor", with: @app_interaction.vendor_id
    click_on "Update Interaction"

    assert_text "Interaction was successfully updated"
    click_on "Back"
  end

  test "should destroy Interaction" do
    visit app_interaction_url(@app_interaction)
    click_on "Destroy this interaction", match: :first

    assert_text "Interaction was successfully destroyed"
  end
end
