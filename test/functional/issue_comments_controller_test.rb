require 'test_helper'

class IssueCommentsControllerTest < ActionController::TestCase
  setup do
    @issue_comment = issue_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:issue_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create issue_comment" do
    assert_difference('IssueComment.count') do
      post :create, issue_comment: @issue_comment.attributes
    end

    assert_redirected_to issue_comment_path(assigns(:issue_comment))
  end

  test "should show issue_comment" do
    get :show, id: @issue_comment.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @issue_comment.to_param
    assert_response :success
  end

  test "should update issue_comment" do
    put :update, id: @issue_comment.to_param, issue_comment: @issue_comment.attributes
    assert_redirected_to issue_comment_path(assigns(:issue_comment))
  end

  test "should destroy issue_comment" do
    assert_difference('IssueComment.count', -1) do
      delete :destroy, id: @issue_comment.to_param
    end

    assert_redirected_to issue_comments_path
  end
end
