require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post :create, post: { brand_id: @post.brand_id, facebook_link: @post.facebook_link, post_copy: @post.post_copy, post_date: @post.post_date, post_total_engagement: @post.post_total_engagement, post_total_reach: @post.post_total_reach }
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test "should show post" do
    get :show, id: @post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post
    assert_response :success
  end

  test "should update post" do
    put :update, id: @post, post: { brand_id: @post.brand_id, facebook_link: @post.facebook_link, post_copy: @post.post_copy, post_date: @post.post_date, post_total_engagement: @post.post_total_engagement, post_total_reach: @post.post_total_reach }
    assert_redirected_to post_path(assigns(:post))
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end

    assert_redirected_to posts_path
  end
end
