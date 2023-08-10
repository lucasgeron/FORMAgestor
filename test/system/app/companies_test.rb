require "application_system_test_case"

class App::CompaniesTest < ApplicationSystemTestCase
  setup do
    @app_company = app_companies(:one)
  end

  test "visiting the index" do
    visit app_companies_url
    assert_selector "h1", text: "Companies"
  end

  test "should create company" do
    visit app_companies_url
    click_on "New company"

    check "Active" if @app_company.active
    fill_in "Client", with: @app_company.client_id
    fill_in "Name", with: @app_company.name
    click_on "Create Company"

    assert_text "Company was successfully created"
    click_on "Back"
  end

  test "should update Company" do
    visit app_company_url(@app_company)
    click_on "Edit this company", match: :first

    check "Active" if @app_company.active
    fill_in "Client", with: @app_company.client_id
    fill_in "Name", with: @app_company.name
    click_on "Update Company"

    assert_text "Company was successfully updated"
    click_on "Back"
  end

  test "should destroy Company" do
    visit app_company_url(@app_company)
    click_on "Destroy this company", match: :first

    assert_text "Company was successfully destroyed"
  end
end
