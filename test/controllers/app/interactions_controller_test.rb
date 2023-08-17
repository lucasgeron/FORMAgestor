require "test_helper"

class App::InteractionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @app_interaction = app_interactions(:one)
  end

  test "should get index" do
    get app_interactions_url
    assert_response :success
  end

  test "should get new" do
    get new_app_interaction_url
    assert_response :success
  end

  test "should create app_interaction" do
    assert_difference("App::Interaction.count") do
      post app_interactions_url, params: { app_interaction: { client_id: @app_interaction.client_id, description: @app_interaction.description, negotiation_id: @app_interaction.negotiation_id, status_id: @app_interaction.status_id, vendor_id: @app_interaction.vendor_id } }
    end

    assert_redirected_to app_interaction_url(App::Interaction.last)
  end

  test "should show app_interaction" do
    get app_interaction_url(@app_interaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_app_interaction_url(@app_interaction)
    assert_response :success
  end

  test "should update app_interaction" do
    patch app_interaction_url(@app_interaction), params: { app_interaction: { client_id: @app_interaction.client_id, description: @app_interaction.description, negotiation_id: @app_interaction.negotiation_id, status_id: @app_interaction.status_id, vendor_id: @app_interaction.vendor_id } }
    assert_redirected_to app_interaction_url(@app_interaction)
  end

  test "should destroy app_interaction" do
    assert_difference("App::Interaction.count", -1) do
      delete app_interaction_url(@app_interaction)
    end

    assert_redirected_to app_interactions_url
  end
end
