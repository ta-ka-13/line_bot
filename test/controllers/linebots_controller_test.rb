require "test_helper"

class LinebotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @linebot = linebots(:one)
  end

  test "should get index" do
    get linebots_url
    assert_response :success
  end

  test "should get new" do
    get new_linebot_url
    assert_response :success
  end

  test "should create linebot" do
    assert_difference('Linebot.count') do
      post linebots_url, params: { linebot: { body: @linebot.body, title: @linebot.title } }
    end

    assert_redirected_to linebot_url(Linebot.last)
  end

  test "should show linebot" do
    get linebot_url(@linebot)
    assert_response :success
  end

  test "should get edit" do
    get edit_linebot_url(@linebot)
    assert_response :success
  end

  test "should update linebot" do
    patch linebot_url(@linebot), params: { linebot: { body: @linebot.body, title: @linebot.title } }
    assert_redirected_to linebot_url(@linebot)
  end

  test "should destroy linebot" do
    assert_difference('Linebot.count', -1) do
      delete linebot_url(@linebot)
    end

    assert_redirected_to linebots_url
  end
end
