require "test_helper"

class App::InstitutionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @app_institution = app_institutions(:one)
  end

  test "should get index" do
    get app_institutions_url
    assert_response :success
  end

  test "should get new" do
    get new_app_institution_url
    assert_response :success
  end

  test "should create app_institution" do
    assert_difference("App::Institution.count") do
      post app_institutions_url, params: { app_institution: { abreviation: @app_institution.abreviation, city_id: @app_institution.city_id, client_id: @app_institution.client_id, name: @app_institution.name } }
    end

    assert_redirected_to app_institution_url(App::Institution.last)
  end

  test "should show app_institution" do
    get app_institution_url(@app_institution)
    assert_response :success
  end

  test "should get edit" do
    get edit_app_institution_url(@app_institution)
    assert_response :success
  end

  test "should update app_institution" do
    patch app_institution_url(@app_institution), params: { app_institution: { abreviation: @app_institution.abreviation, city_id: @app_institution.city_id, client_id: @app_institution.client_id, name: @app_institution.name } }
    assert_redirected_to app_institution_url(@app_institution)
  end

  test "should destroy app_institution" do
    assert_difference("App::Institution.count", -1) do
      delete app_institution_url(@app_institution)
    end

    assert_redirected_to app_institutions_url
  end
end
