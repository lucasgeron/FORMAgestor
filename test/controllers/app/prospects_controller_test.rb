require "test_helper"

class App::ProspectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @app_prospect = app_prospects(:one)
  end

  test "should get index" do
    get app_prospects_url
    assert_response :success
  end

  test "should get new" do
    get new_app_prospect_url
    assert_response :success
  end

  test "should create app_prospect" do
    assert_difference("App::Prospect.count") do
      post app_prospects_url, params: { app_prospect: { amount: @app_prospect.amount, channel: @app_prospect.channel, city: @app_prospect.city, course: @app_prospect.course, instagram: @app_prospect.instagram, institution: @app_prospect.institution, name: @app_prospect.name, phone: @app_prospect.phone, vendor_id: @app_prospect.vendor_id, year_graduation: @app_prospect.year_graduation } }
    end

    assert_redirected_to app_prospect_url(App::Prospect.last)
  end

  test "should show app_prospect" do
    get app_prospect_url(@app_prospect)
    assert_response :success
  end

  test "should get edit" do
    get edit_app_prospect_url(@app_prospect)
    assert_response :success
  end

  test "should update app_prospect" do
    patch app_prospect_url(@app_prospect), params: { app_prospect: { amount: @app_prospect.amount, channel: @app_prospect.channel, city: @app_prospect.city, course: @app_prospect.course, instagram: @app_prospect.instagram, institution: @app_prospect.institution, name: @app_prospect.name, phone: @app_prospect.phone, vendor_id: @app_prospect.vendor_id, year_graduation: @app_prospect.year_graduation } }
    assert_redirected_to app_prospect_url(@app_prospect)
  end

  test "should destroy app_prospect" do
    assert_difference("App::Prospect.count", -1) do
      delete app_prospect_url(@app_prospect)
    end

    assert_redirected_to app_prospects_url
  end
end
