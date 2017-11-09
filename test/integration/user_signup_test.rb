require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest
  
  test "sign up new user"
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, params:{user:{ username: "Kemp1", email: "Kemp1@example.com", password: "password"}}
    end
    assert_template 'users/show'
    assert_match "Kemp1", response.body
end 