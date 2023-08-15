require "application_system_test_case"

class App::ContactsTest < ApplicationSystemTestCase
  setup do
    @app_contact = app_contacts(:one)
  end

  test "visiting the index" do
    visit app_contacts_url
    assert_selector "h1", text: "Contacts"
  end

  test "should create contact" do
    visit app_contacts_url
    click_on "New contact"

    check "Committee" if @app_contact.committee
    check "Informant" if @app_contact.informant
    fill_in "Instagram", with: @app_contact.instagram
    fill_in "Name", with: @app_contact.name
    fill_in "Negotiation", with: @app_contact.negotiation_id
    fill_in "Phone", with: @app_contact.phone
    click_on "Create Contact"

    assert_text "Contact was successfully created"
    click_on "Back"
  end

  test "should update Contact" do
    visit app_contact_url(@app_contact)
    click_on "Edit this contact", match: :first

    check "Committee" if @app_contact.committee
    check "Informant" if @app_contact.informant
    fill_in "Instagram", with: @app_contact.instagram
    fill_in "Name", with: @app_contact.name
    fill_in "Negotiation", with: @app_contact.negotiation_id
    fill_in "Phone", with: @app_contact.phone
    click_on "Update Contact"

    assert_text "Contact was successfully updated"
    click_on "Back"
  end

  test "should destroy Contact" do
    visit app_contact_url(@app_contact)
    click_on "Destroy this contact", match: :first

    assert_text "Contact was successfully destroyed"
  end
end
