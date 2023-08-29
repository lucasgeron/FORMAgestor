require "test_helper"

class App::StatusInteractionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @app_status_interaction = app_status_interactions(:one)
  end

  test "should get index" do
    get app_status_interactions_url
    assert_response :success
  end

  test "should get new" do
    get new_app_status_interaction_url
    assert_response :success
  end

  test "should create app_status_interaction" do
    assert_difference("App::StatusInteraction.count") do
      post app_status_interactions_url, params: { app_status_interaction: { active: @app_status_interaction.active, client_id: @app_status_interaction.client_id, color: @app_status_interaction.color, icon: @app_status_interaction.icon, name: @app_status_interaction.name, style: @app_status_interaction.style } }
    end

    assert_redirected_to app_status_interaction_url(App::StatusInteraction.last)
  end

  test "should show app_status_interaction" do
    get app_status_interaction_url(@app_status_interaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_app_status_interaction_url(@app_status_interaction)
    assert_response :success
  end

  test "should update app_status_interaction" do
    patch app_status_interaction_url(@app_status_interaction), params: { app_status_interaction: { active: @app_status_interaction.active, client_id: @app_status_interaction.client_id, color: @app_status_interaction.color, icon: @app_status_interaction.icon, name: @app_status_interaction.name, style: @app_status_interaction.style } }
    assert_redirected_to app_status_interaction_url(@app_status_interaction)
  end

  test "should destroy app_status_interaction" do
    assert_difference("App::StatusInteraction.count", -1) do
      delete app_status_interaction_url(@app_status_interaction)
    end

    assert_redirected_to app_status_interactions_url
  end
end
