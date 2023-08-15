require "test_helper"

class App::ContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @app_contact = app_contacts(:one)
  end

  test "should get index" do
    get app_contacts_url
    assert_response :success
  end

  test "should get new" do
    get new_app_contact_url
    assert_response :success
  end

  test "should create app_contact" do
    assert_difference("App::Contact.count") do
      post app_contacts_url, params: { app_contact: { committee: @app_contact.committee, informant: @app_contact.informant, instagram: @app_contact.instagram, name: @app_contact.name, negotiation_id: @app_contact.negotiation_id, phone: @app_contact.phone } }
    end

    assert_redirected_to app_contact_url(App::Contact.last)
  end

  test "should show app_contact" do
    get app_contact_url(@app_contact)
    assert_response :success
  end

  test "should get edit" do
    get edit_app_contact_url(@app_contact)
    assert_response :success
  end

  test "should update app_contact" do
    patch app_contact_url(@app_contact), params: { app_contact: { committee: @app_contact.committee, informant: @app_contact.informant, instagram: @app_contact.instagram, name: @app_contact.name, negotiation_id: @app_contact.negotiation_id, phone: @app_contact.phone } }
    assert_redirected_to app_contact_url(@app_contact)
  end

  test "should destroy app_contact" do
    assert_difference("App::Contact.count", -1) do
      delete app_contact_url(@app_contact)
    end

    assert_redirected_to app_contacts_url
  end
end
