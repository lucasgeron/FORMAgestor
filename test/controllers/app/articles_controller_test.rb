require "test_helper"

class App::ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @app_article = app_articles(:one)
  end

  test "should get index" do
    get app_articles_url
    assert_response :success
  end

  test "should get new" do
    get new_app_article_url
    assert_response :success
  end

  test "should create app_article" do
    assert_difference("App::Article.count") do
      post app_articles_url, params: { app_article: { body: @app_article.body, cover_url: @app_article.cover_url, title: @app_article.title } }
    end

    assert_redirected_to app_article_url(App::Article.last)
  end

  test "should show app_article" do
    get app_article_url(@app_article)
    assert_response :success
  end

  test "should get edit" do
    get edit_app_article_url(@app_article)
    assert_response :success
  end

  test "should update app_article" do
    patch app_article_url(@app_article), params: { app_article: { body: @app_article.body, cover_url: @app_article.cover_url, title: @app_article.title } }
    assert_redirected_to app_article_url(@app_article)
  end

  test "should destroy app_article" do
    assert_difference("App::Article.count", -1) do
      delete app_article_url(@app_article)
    end

    assert_redirected_to app_articles_url
  end
end
