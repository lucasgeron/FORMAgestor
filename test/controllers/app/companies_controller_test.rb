require "test_helper"

class App::CompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @app_company = app_companies(:one)
  end

  test "should get index" do
    get app_companies_url
    assert_response :success
  end

  test "should get new" do
    get new_app_company_url
    assert_response :success
  end

  test "should create app_company" do
    assert_difference("App::Company.count") do
      post app_companies_url, params: { app_company: { active: @app_company.active, client_id: @app_company.client_id, name: @app_company.name } }
    end

    assert_redirected_to app_company_url(App::Company.last)
  end

  test "should show app_company" do
    get app_company_url(@app_company)
    assert_response :success
  end

  test "should get edit" do
    get edit_app_company_url(@app_company)
    assert_response :success
  end

  test "should update app_company" do
    patch app_company_url(@app_company), params: { app_company: { active: @app_company.active, client_id: @app_company.client_id, name: @app_company.name } }
    assert_redirected_to app_company_url(@app_company)
  end

  test "should destroy app_company" do
    assert_difference("App::Company.count", -1) do
      delete app_company_url(@app_company)
    end

    assert_redirected_to app_companies_url
  end
end
