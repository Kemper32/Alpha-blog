require 'test_helper'

class NewArticleTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = User.create(username: "Chris", email: "Chris@example.com", password: "password", admin: true)
  end
  
  test "create a new article" do
    sign_in_as(@user, "password")
    get create_article_path
    assert_template 'articles/create'
    assert_difference 'Article.count', 1 do
      post_via_redirect articles_path, article: {title: "Test article", description: "This is a test description"}
    end
    assert_template 'articles/index'
    assert_match "Test article", response.body
  end
end