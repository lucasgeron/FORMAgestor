require "application_system_test_case"

class App::InstitutionsTest < ApplicationSystemTestCase
  setup do
    @app_institution = app_institutions(:one)
  end

  test "visiting the index" do
    visit app_institutions_url
    assert_selector "h1", text: "Institutions"
  end

  test "should create institution" do
    visit app_institutions_url
    click_on "New institution"

    fill_in "Abreviation", with: @app_institution.abreviation
    fill_in "City", with: @app_institution.city_id
    fill_in "Client", with: @app_institution.client_id
    fill_in "Name", with: @app_institution.name
    click_on "Create Institution"

    assert_text "Institution was successfully created"
    click_on "Back"
  end

  test "should update Institution" do
    visit app_institution_url(@app_institution)
    click_on "Edit this institution", match: :first

    fill_in "Abreviation", with: @app_institution.abreviation
    fill_in "City", with: @app_institution.city_id
    fill_in "Client", with: @app_institution.client_id
    fill_in "Name", with: @app_institution.name
    click_on "Update Institution"

    assert_text "Institution was successfully updated"
    click_on "Back"
  end

  test "should destroy Institution" do
    visit app_institution_url(@app_institution)
    click_on "Destroy this institution", match: :first

    assert_text "Institution was successfully destroyed"
  end
end
