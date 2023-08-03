require "application_system_test_case"

class App::ArticlesTest < ApplicationSystemTestCase
  setup do
    @app_article = app_articles(:one)
  end

  test "visiting the index" do
    visit app_articles_url
    assert_selector "h1", text: "Articles"
  end

  test "should create article" do
    visit app_articles_url
    click_on "New article"

    fill_in "Body", with: @app_article.body
    fill_in "Cover url", with: @app_article.cover_url
    fill_in "Title", with: @app_article.title
    click_on "Create Article"

    assert_text "Article was successfully created"
    click_on "Back"
  end

  test "should update Article" do
    visit app_article_url(@app_article)
    click_on "Edit this article", match: :first

    fill_in "Body", with: @app_article.body
    fill_in "Cover url", with: @app_article.cover_url
    fill_in "Title", with: @app_article.title
    click_on "Update Article"

    assert_text "Article was successfully updated"
    click_on "Back"
  end

  test "should destroy Article" do
    visit app_article_url(@app_article)
    click_on "Destroy this article", match: :first

    assert_text "Article was successfully destroyed"
  end
end
